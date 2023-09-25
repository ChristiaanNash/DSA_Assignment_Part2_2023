import ballerina/grpc;

listener grpc:Listener ep = new (9090);

//Table to store books
table<BookInfo> key(isbn) books = table [];

//Table to store users
table<User> key(user_id) users = table [];


@grpc:Descriptor {value: LIBRARY_DESC}
service "LibraryService" on ep {

    remote function add_book(AddBookRequest value) returns AddBookResponse|error {
        //Define the new book
        BookInfo book = {
            title: value.title,
            author_1: value.author_1,
            author_2: value.author_2,
            location: value.location,
            isbn: value.isbn,
            available: true // New book is available
        };

        // Add the book to the table
        _ = books.add(book);

        return {isbn: value.isbn};

    }
    remote function update_book(UpdateBookRequest value) returns UpdateBookResponse|error {
        // Find the book to update based on the provided ISBN
        BookInfo|error bookToBeUpdated = books.get(value.isbn);

        if (bookToBeUpdated is error) {
            return error("Book not found");
        }

        // Create a BookInfo record with the updated values
        BookInfo updatedBook = {
            title: value.title,
            author_1: value.author_1,
            author_2: value.author_2,
            location: value.location,
            isbn: value.isbn,
            available: bookToBeUpdated.available // Preserve the availability status
        };

        // Update the book entry with the new values
        books.put(updatedBook);

        return {message: "Book updated successfully."};

    }
    remote function remove_book(RemoveBookRequest value) returns RemoveBookResponse|error {
        BookInfo|error remove = books.remove(value.isbn);
        
        if (remove is error) {
            return error ("Book not found"); // Handle the case when the book is not found
        }

        BookInfo[] updatedBooks = [];

        foreach BookInfo book in books {
   	        updatedBooks.push(book);
   	    }

        // Return the updated list of books
        return {books: updatedBooks};

    }
    remote function list_borrowed_books(ListBorrowedBooksRequest value) returns ListBorrowedBooksResponse|error {
        BookInfo[] borrowedBooks = [];

        //Check all books and add those that are borrowed to the above list
        foreach BookInfo book in books {
            if(book.available != true){
                borrowedBooks.push(book);
            }
   	    }

        // Return the updated list of books (optional)
        return {books: borrowedBooks};

    }
    remote function list_available_books(ListAvailableBooksRequest value) returns ListAvailableBooksResponse|error {
        BookInfo[] availableBooks = [];

        //Check all books and add those that are borrowed to the above list
        foreach BookInfo book in books {
            if(book.available == true){
                availableBooks.push(book);
            }
   	    }

        // Return the updated list of books (optional)
        return {books: availableBooks};

    }
    remote function locate_book(LocateBookRequest value) returns LocateBookResponse|error {
         // Find the book to update based on the provided ISBN
        BookInfo|error bookRequested = books.get(value.isbn);

        if (bookRequested is error) {
            return error("Book not found");
        }

        return {location: bookRequested.location, available: bookRequested.available};

    }
    remote function borrow_book(BorrowBookRequest value) returns BorrowBookResponse|error {
        // Find the book to update based on the provided ISBN
        BookInfo|error bookToBeBorrowed = books.get(value.isbn);

        if (bookToBeBorrowed is error) {
            return error("Book not found");
        }

        //Check if user exists using provided user ID
        User|error interestedUser = users.get(value.user_id);

        if(interestedUser is error){
            return error ("User not found");
        }

        //User may not borrow if they aren't a student
        if(interestedUser.user_type != STUDENT){
            return error("User not authorized to borrow");
        }

        // Update the book's availability to false (book is now borrowed)
        bookToBeBorrowed.available = false;
        books.put(bookToBeBorrowed);

        return {success: true, message: "Book successfully borrowed"};

    }
    remote function create_users(stream<CreateUserRequest, grpc:Error?> clientStream) returns CreateUserResponse|error {
        int totalUsersCreated = 0;
        string errorMessage = "";

        // Iterate through the streamed CreateUserRequest objects
        check clientStream.forEach(function(CreateUserRequest userRequest) {
            // Check if the user already exists in the users table to prevent duplicate entries
            // User|error existingUser = users.get(userRequest.user_id);

            // if (existingUser is error) {
            //     errorMessage = "User with ID already exists: " + userRequest.user_id;
            //     return;
            // }

            // Create a new user based on the CreateUserRequest and add it to the users table
            User newUser = {
                user_id: userRequest.user_id,
                user_type: userRequest.user_type
            };

            users.add(newUser);
            totalUsersCreated = totalUsersCreated + 1;
        });

        // Create the response based on the number of users created and error message
        CreateUserResponse response;
        if (errorMessage != "") {
            response = { success: false, message: errorMessage };
        } else {
            response = { success: true, message: totalUsersCreated.toString() + " Users created successfully" };
        }

        return response;

    }
}

