<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Books | Noava Online Book Store</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<header class="header">
    <h1>
        <i class="fa-solid fa-book"></i>
        Noava Online Book Store
    </h1>
    <p>Your one-stop shop for books</p>
</header>

<nav class="nav">
    <a href="index.jsp">
        <i class="fa-solid fa-house"></i> Home
    </a>
    <a href="books">
        <i class="fa-solid fa-book-open"></i> View Books
    </a>
</nav>

<section class="content">
    <h2>Available Books</h2>

    <table class="books-table">
        <tr>
            <th>#</th>
            <th>Title</th>
            <th>Author</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Clean Code</td>
            <td>Robert C. Martin</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Effective Java</td>
            <td>Joshua Bloch</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Design Patterns</td>
            <td>GoF</td>
        </tr>
    </table>
</section>

<footer class="footer">
    <p>© 2026 Noava Technologies</p>
</footer>

</body>
</html>

