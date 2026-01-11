package com.noava.bookstore.service;

import com.noava.bookstore.model.Book;
import com.noava.bookstore.repository.BookRepository;
import java.util.List;

public class BookService {

    private final BookRepository repository;

    public BookService(BookRepository repository) {
        this.repository = repository;
    }

    public List<Book> getAvailableBooks() {
        return repository.findAll();
    }
}
