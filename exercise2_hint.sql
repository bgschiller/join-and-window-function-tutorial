SELECT book.id, loan.borrower_id, COUNT(*) OVER (PARTITION BY book.id) AS total_borrows
FROM book
    JOIN book_copy ON (book.id = book_copy.book_id)
    JOIN loan ON (book_copy.id = loan.book_copy_id)
