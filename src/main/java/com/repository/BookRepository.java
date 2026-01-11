package com.noava.bookstore.repository;

import com.noava.bookstore.model.Book;
import java.util.List;

public interface BookRepository {

    List<Book> findAll();
}
