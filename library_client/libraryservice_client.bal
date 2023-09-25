import ballerina/io;

LibraryServiceClient ep = check new ("http://localhost:9090");

// Function to display the menu of actions and get user choice
function getMenuChoice() returns string {
    io:println("Library System Menu:");
    io:println("1. Create Users");
    io:println("2. Add Book");
    io:println("3. Update Book");
    io:println("4. List borrowed books");
    io:println("5. List available books");
    io:println("6. Locate Book");
    io:println("7. Borrow Book");
    io:println("8. Remove Book");
    io:println("Enter 'q' to quit");

    string choice = io:readln("Enter your choice: ");
    return choice;
}

public function main() returns error? {

        while (true) {
        string choice = getMenuChoice();

        if (choice == "1") {
            // Create users
            CreateUserResponse?|error users = createUsers();
            if users is CreateUserResponse {
                string successMessage = users.message;
                io:println(successMessage);
            } else if users is () {
                io:println("Something...");
            } else {
                string errorMessage = users.message();
                io:println(errorMessage);
            }

        } else if (choice == "2") {
            // Add Book
            AddBookResponse|error book = addBook();
            if book is AddBookResponse {
                io:println("Book successfully created");
                io:println("ISBN: " +book.isbn);
            } else {
                string errorMessage = book.message();
                io:println(errorMessage);
            }
        } else if (choice == "3") {
            // Update Book
            UpdateBookResponse|error book = updateBook();
            if book is UpdateBookResponse {
                string successMessage = book.message;
                io:println(successMessage);
            } else {
                string errorMessage = book.message();
                io:println(errorMessage);
            }
        }  else if (choice == "4") {
            // Locate Book
            ListBorrowedBooksResponse|error listBorrowedBooksResult = listBorrowedBooks();
            if listBorrowedBooksResult is ListBorrowedBooksResponse {
                io:println("_______________________________________");
                io:println("Borrowed Books:");

                foreach var book in listBorrowedBooksResult.books {
                    io:println("ISBN: "+ book.isbn);
                    io:println("Title: "+ book.title);
                    io:println("Author 1: "+ book.author_1);
                    io:println("Location: "+ book.location);
                    io:println("_______________________________________________");
                }
            } else {
                string errorMessage = listBorrowedBooksResult.message();
                io:println(errorMessage);
            }
        } else if (choice == "5") {
            // List all available Books
            ListAvailableBooksResponse|error listAvailableBooksResult = listAvailableBooks();
            if listAvailableBooksResult is ListAvailableBooksResponse {
                io:println("_______________________________________");
                io:println("Available Books:");

                foreach var book in listAvailableBooksResult.books {
                    io:println("ISBN: "+ book.isbn);
                    io:println("Title: "+ book.title);
                    io:println("Author 1: "+ book.author_1);
                    io:println("Location: "+ book.location);
                    io:println("_______________________________________________");
                }
            } else {
                string errorMessage = listAvailableBooksResult.message();
                io:println(errorMessage);
            }
        }
        else if (choice == "6") {
            // Locate Book
            LocateBookResponse|error locateBookResult = locateBook();
            if locateBookResult is LocateBookResponse {
                string bookLocation = locateBookResult.location;
                string bookAvailability = "";
                if locateBookResult.available is true {
                    bookAvailability = "Available"; 
                } else {
                    bookAvailability = "Not Available";
                }

                io:println("Book Location: "+bookLocation);
                io:println("Book Availability: "+bookAvailability);
            }
            else {
                io:println(locateBookResult.stackTrace());
                io:println(locateBookResult.cause());
            }
        }
        else if (choice == "7") {
            // Locate Book
            BorrowBookResponse|error borrowBookResult = borrowBook();
            if borrowBookResult is BorrowBookResponse {
                string successMessage = borrowBookResult.message;
                io:println(successMessage);
            } else {
                string errorMessage = borrowBookResult.message();
                io:println(errorMessage);
            }
        }
        else if (choice == "8") {
            // Remove Book
            RemoveBookResponse|error removeBookResult = removeBook();
            if removeBookResult is RemoveBookResponse {
                io:println("Book succesfully removed");
                io:println("_______________________________________");
                io:println("Remaining Books:");

                foreach var book in removeBookResult.books {
                    io:println("ISBN: "+ book.isbn);
                    io:println("Title: "+ book.title);
                    io:println("Author 1: "+ book.author_1);
                    io:println("Location: "+ book.location);
                    io:println("_______________________________________________");
                }
            } else {
                io:println(removeBookResult.stackTrace());
                io:println(removeBookResult.cause());
            }
        }
         else if (choice == "q") {
            // Quit the application
            break;
        } else {
            io:println("Invalid choice. Please try again.");
        }
    }
    // CreateUserRequest create_usersRequest = {user_id: "ballerina", user_type: STUDENT};
    // Create_usersStreamingClient create_usersStreamingClient = check ep->create_users();
    // check create_usersStreamingClient->sendCreateUserRequest(create_usersRequest);
    // check create_usersStreamingClient->complete();
    // CreateUserResponse? create_usersResponse = check create_usersStreamingClient->receiveCreateUserResponse();
    // io:println(create_usersResponse);

    // AddBookRequest add_bookRequest = {title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina", isbn: "ballerina"};
    // AddBookResponse add_bookResponse = check ep->add_book(add_bookRequest);
    // io:println(add_bookResponse);

    // UpdateBookRequest update_bookRequest = {isbn: "ballerina", title: "ballerina", author_1: "ballerina", author_2: "ballerina", location: "ballerina"};
    // UpdateBookResponse update_bookResponse = check ep->update_book(update_bookRequest);
    // io:println(update_bookResponse);

    // BorrowBookRequest borrow_bookRequest = {user_id: "ballerina", isbn: "ballerina"};
    // BorrowBookResponse borrow_bookResponse = check ep->borrow_book(borrow_bookRequest);
    // io:println(borrow_bookResponse);

    // ListBorrowedBooksRequest list_borrowed_booksRequest = {};
    // ListBorrowedBooksResponse list_borrowed_booksResponse = check ep->list_borrowed_books(list_borrowed_booksRequest);
    // io:println(list_borrowed_booksResponse);

    // ListAvailableBooksRequest list_available_booksRequest = {};
    // ListAvailableBooksResponse list_available_booksResponse = check ep->list_available_books(list_available_booksRequest);
    // io:println(list_available_booksResponse);

    // LocateBookRequest locate_bookRequest = {isbn: "ballerina"};
    // LocateBookResponse locate_bookResponse = check ep->locate_book(locate_bookRequest);
    // io:println(locate_bookResponse);

    // RemoveBookRequest remove_bookRequest = {isbn: "ballerina"};
    // RemoveBookResponse remove_bookResponse = check ep->remove_book(remove_bookRequest);
    // io:println(remove_bookResponse);
}

// Function to create users and send them to the server
public function createUsers() returns CreateUserResponse?|error {
    // Create a streaming client to send user creation requests
    Create_usersStreamingClient create_usersStreamingClient = check ep->create_users();

    while (true) {
        // Interactively collect user input
        io:println("Enter user information:");
        string userId = io:readln("User ID: ");
        io:println("User Type (STUDENT/LIBRARIAN): ");
        string userTypeInput = io:readln();
        
        UserType userType;
        if (userTypeInput == "STUDENT") {
            userType = STUDENT;
        } else if (userTypeInput == "LIBRARIAN") {
            userType = LIBRARIAN;
        } else {
            io:println("Invalid user type. Using default: STUDENT");
            userType = STUDENT;
        }

        // Create a CreateUserRequest
        CreateUserRequest createUserRequest = {
            user_id: userId,
            user_type: userType
        };

        // Send the CreateUserRequest to the server
        check create_usersStreamingClient->sendCreateUserRequest(createUserRequest);

        // Ask the user if they want to create another user
        io:println("Do you want to create another user? (yes/no): ");
        string continueInput = io:readln();

        if (continueInput != "yes") {
            break;
        }
    }

    // Complete the streaming client
    check create_usersStreamingClient->complete();

    // Receive the CreateUserResponse from the server
    CreateUserResponse? createUserResponse = check create_usersStreamingClient->receiveCreateUserResponse();

    return createUserResponse;
}

// Function to interactively collect book information for adding a book
function getBookInfoFromInput() returns AddBookRequest {
    io:println("Enter book information:");

    // Read book title from input
    string title = io:readln("Title: ");

    // Read book author(s) from input
    string author1 = io:readln("Author 1: ");
    string author2 = io:readln("Author 2: ");

    // Read book location from input
    string location = io:readln("Location in the library: ");

    // Read book ISBN from input
    string isbn = io:readln("ISBN: ");

    AddBookRequest addBookRequest = {
        title: title,
        author_1: author1,
        author_2: author2,
        location: location,
        isbn: isbn
    };

    return addBookRequest;
}

// Function to add a book to the library
function addBook() returns AddBookResponse|error {
    // Interactively collect book information
    AddBookRequest addBookRequest = getBookInfoFromInput();

    // Invoke the add_book gRPC function with the book information
    AddBookResponse|error addBookResponse = ep->add_book(addBookRequest);

    return addBookResponse;
}

// Function to interactively collect book information for updating a book
function getUpdatedBookInfoFromInput() returns UpdateBookRequest {
    // Read book ISBN from input
    string isbn = io:readln("Enter the ISBN of the book to update: ");

    // Read updated book title from input
    string updatedTitle = io:readln("Updated Title: ");

    // Read updated book author(s) from input
    string updatedAuthor1 = io:readln("Updated Author 1: ");
    string updatedAuthor2 = io:readln("Updated Author 2 (optional, press Enter to skip): ");

    // Read updated book location from input
    string updatedLocation = io:readln("Updated Location in the library: ");

    UpdateBookRequest updateBookRequest = {
        isbn: isbn,
        title: updatedTitle,
        author_1: updatedAuthor1,
        author_2: updatedAuthor2,
        location: updatedLocation
    };

    return updateBookRequest;
}

// Function to update a book in the library
function updateBook() returns UpdateBookResponse|error {
    // Interactively collect updated book information
    UpdateBookRequest updateBookRequest = getUpdatedBookInfoFromInput();

    // Invoke the update_book gRPC function with the updated book information
    UpdateBookResponse|error updateBookResponse = ep->update_book(updateBookRequest);

    return updateBookResponse;
}

// Function to interactively collect book information for removing a book
function getRemoveBookInfoFromInput() returns RemoveBookRequest {
    io:println("Enter book information to remove:");

    // Read book ISBN from input
    string isbn = io:readln("Enter the ISBN of the book to remove: ");

    RemoveBookRequest removeBookRequest = {
        isbn: isbn
    };

    return removeBookRequest;
}

// Function to remove a book from the library
function removeBook() returns RemoveBookResponse|error {
    // Interactively collect book information to remove
    RemoveBookRequest removeBookRequest = getRemoveBookInfoFromInput();

    // Invoke the remove_book gRPC function with the book information to remove
    RemoveBookResponse|error removeBookResponse = ep->remove_book(removeBookRequest);

    return removeBookResponse;
}

// Function to interactively collect book ISBN for locating a book
function getBookISBNForLocateFromInput() returns LocateBookRequest {
    // Read book ISBN from input
    string isbn = io:readln("Enter the ISBN of the book to locate: ");

    LocateBookRequest locateBookRequest = {
        isbn: isbn
    };

    return locateBookRequest;
}

// Function to locate a book in the library based on ISBN
function locateBook() returns LocateBookResponse|error {
    // Interactively collect book ISBN to locate
    LocateBookRequest locateBookRequest = getBookISBNForLocateFromInput();

    // Invoke the locate_book gRPC function with the book ISBN
    LocateBookResponse|error locateBookResponse = check ep->locate_book(locateBookRequest);

    return locateBookResponse;
}

// Function to interactively collect user ID and book ISBN for borrowing a book
function getBorrowBookInfoFromInput() returns BorrowBookRequest {
    // Read user ID from input
    string userId = io:readln("User ID: ");

    // Read book ISBN from input
    string isbn = io:readln("Enter the ISBN of the book to borrow: ");

    BorrowBookRequest borrowBookRequest = {
        user_id: userId,
        isbn: isbn
    };

    return borrowBookRequest;
}

// Function to allow a student to borrow a book
function borrowBook() returns BorrowBookResponse|error {
    // Interactively collect user ID and book ISBN for borrowing
    BorrowBookRequest borrowBookRequest = getBorrowBookInfoFromInput();

    // Invoke the borrow_book gRPC function with the user ID and book ISBN
    BorrowBookResponse|error borrowBookResponse = ep->borrow_book(borrowBookRequest);

    return borrowBookResponse;
}

// Function to list all available books in the library
function listAvailableBooks() returns ListAvailableBooksResponse|error {
    // Create an empty request for listing available books
    ListAvailableBooksRequest listAvailableBooksRequest = {};

    // Invoke the list_available_books gRPC function to get the list of available books
    ListAvailableBooksResponse|error listAvailableBooksResponse = ep->list_available_books(listAvailableBooksRequest);

    return listAvailableBooksResponse;
}

// Function to list all borrowed books in the library
function listBorrowedBooks() returns ListBorrowedBooksResponse|error {
    // Create an empty request for listing borrowed books
    ListBorrowedBooksRequest listBorrowedBooksRequest = {};

    // Invoke the list_borrowed_books gRPC function to get the list of borrowed books
    ListBorrowedBooksResponse|error listBorrowedBooksResponse = ep->list_borrowed_books(listBorrowedBooksRequest);

    return listBorrowedBooksResponse;
}