# Todo CLI

Make sure postgres is running, also update the [connect_db.rb](connect_db.rb) with the necessary details.

## Migration

Will create the table `todos` with the appropriate columns and its data-type
```bash
ruby create-todos-table.rb
```

To check if the table was created, follow these steps

- Make sure postgresql is running. You can check using `sudo systemctl status postgresql`
- Open postgresql CLI using the command `sudo -i -u postgres` and then `psql`
- Type `\l` to get the list of databases. Look if `saas-db` exists or not.
- Type `\c saas-db` to connect to that database
- Type `\dt` it will list all the tables and check if the `todos` exists.
- Now you can run sql queries like
  ```sql
  SELECT * FROM todos
  ```
  to get all the todos

## List todos

```bash
ruby list-todos.rb
```

## Add todos

```bash
ruby add-todo.rb
```

## Mark a todo completed

```bash
ruby complete-todo.rb
```
