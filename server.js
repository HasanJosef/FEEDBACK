import express from "express";
import mysql from "mysql2/promise";
import path from "path";
import { fileURLToPath } from "url";
import bodyParser from "body-parser";
import session from "express-session";
<<<<<<< HEAD
=======
import bcrypt from "bcrypt";
>>>>>>> 41e2118 (4)

const port = 3000;
const host = "localhost";
const dbHost = "localhost";
const dbName = "feedback_support";
const dbUser = "root";
const dbPwd = "";

const app = express();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

app.use("/includes", express.static(path.join(__dirname, "includes")));

app.use(bodyParser.urlencoded({ extended: true }));

app.use(
  session({
    secret: "your_secret_key",
    resave: false,
    saveUninitialized: true,
  })
);

// Middleware to check if user is authenticated
function isAuthenticated(req, res, next) {
  if (req.session.user) {
    return next();
  } else {
    res.redirect("/login");
  }
}

<<<<<<< HEAD
// Middleware to check if user is admin
=======
>>>>>>> 41e2118 (4)
function isAdmin(req, res, next) {
  if (req.session.user && req.session.user.admin) {
    return next();
  } else {
    res.redirect("/login");
  }
}

app.use((req, res, next) => {
  res.locals.user = req.session.user;
  next();
});

app.get("/", (req, res) => {
  res.redirect("/customers-users");
});

app.get("/login", (req, res) => {
  res.render("login");
});

app.post("/login", async (req, res) => {
  const { identifier } = req.body;
  let connection;
  try {
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
<<<<<<< HEAD
=======

>>>>>>> 41e2118 (4)
    const [rows] = await connection.execute(
      "SELECT * FROM system_user WHERE id = ? OR email = ?",
      [identifier, identifier]
    );
<<<<<<< HEAD
    if (rows.length > 0 && rows[0].admin) {
      req.session.user = rows[0];
      res.redirect("/customers-users");
=======

    if (rows.length > 0) {
      const user = rows[0];

      if (!user.password) {
        return res.render("login", {
          error: "Virheelliset tunnistetiedot tai ei järjestelmänvalvoja",
        });
      }

      const match = await bcrypt.compare(password, user.password);

      if (match && user.admin) {
        req.session.user = user;
        res.redirect("/customer-users");
      } else {
        res.render("login", {
          error: "Virheelliset tunnistetiedot tai ei järjestelmänvalvoja",
        });
      }
>>>>>>> 41e2118 (4)
    } else {
      res.render("login", {
        error: "Virheelliset tunnistetiedot tai ei järjestelmänvalvoja",
      });
    }
  } catch (err) {
<<<<<<< HEAD
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
=======
>>>>>>> 41e2118 (4)
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.get("/logout", (req, res) => {
  req.session.destroy();
  res.redirect("/login");
});

app.get("/api/feedback", isAuthenticated, async (req, res) => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
<<<<<<< HEAD
    const [rows] = await connection.execute("SELECT * FROM feedback");
    res.json(rows);
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
=======

    const [customers] = await connection.execute(
      "SELECT id, name FROM customer"
    );

    const [users] = await connection.execute(
      "SELECT id, fullname, email, mailing_list, customer_id, admin FROM system_user"
    );

    res.render("customers-users", {
      user: req.session.user,
      customers: customers,
      users: users,
    });
  } catch (err) {
>>>>>>> 41e2118 (4)
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.get("/api/feedback/:id", isAuthenticated, async (req, res) => {
  let connection;
  try {
    const id = parseInt(req.params.id);
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
    const [rows] = await connection.execute(
      "SELECT * FROM feedback WHERE id = ?",
      [id]
    );
    res.json(rows);
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.get("/feedback", isAuthenticated, async (req, res) => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
    const [rows] = await connection.execute("SELECT * FROM feedback");
    res.render("feedback", { rows });
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.get("/customers-users", isAuthenticated, async (req, res) => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
    const [customers] = await connection.execute("SELECT * FROM customer");
    const [users] = await connection.execute("SELECT * FROM system_user");
    res.render("customers-users", { customers, users });
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.get("/support-tickets", isAuthenticated, async (req, res) => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
    const [tickets] = await connection.execute("SELECT * FROM support_ticket");
    res.render("support-tickets", { tickets });
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.get("/support-ticket/:id", isAuthenticated, async (req, res) => {
  let connection;
  try {
    const id = parseInt(req.params.id);
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
    const [ticketRows] = await connection.execute(
      "SELECT * FROM support_ticket WHERE id = ?",
      [id]
    );
    const [messageRows] = await connection.execute(
      "SELECT * FROM support_message WHERE ticket_id = ?",
      [id]
    );
    const [statusRows] = await connection.execute(
      "SELECT * FROM ticket_status"
    );
    if (ticketRows.length === 0) {
      res.status(404).send("Ticket not found");
      return;
    }
    console.log("Ticket:", ticketRows[0]);
    console.log("Messages:", messageRows);
    res.render("support-ticket", {
      ticket: ticketRows[0],
      messages: messageRows,
      statuses: statusRows,
    });
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.post("/support-ticket/:id/reply", isAuthenticated, async (req, res) => {
  let connection;
  try {
    const id = parseInt(req.params.id);
    const { body } = req.body;
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
    await connection.execute(
      "INSERT INTO support_message (ticket_id, from_user, body) VALUES (?, ?, ?)",
      [id, 1, body]
    );
    res.redirect(`/support-ticket/${id}`);
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.post("/support-ticket/:id/status", isAuthenticated, async (req, res) => {
  let connection;
  try {
    const id = parseInt(req.params.id);
    const { status } = req.body;
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
      database: dbName,
    });
    const handled = status === "4" ? "NOW()" : "NULL";
    await connection.execute(
      `UPDATE support_ticket SET status = ?, handled = ${handled} WHERE id = ?`,
      [status, id]
    );
    res.redirect(`/support-ticket/${id}`);
  } catch (err) {
    console.error(
      "Database error:",
      err.message,
      "Errno:",
      err.errno,
      "SQL State:",
      err.sqlState
    );
    res.status(500).send("Internal Server Error");
  } finally {
    if (connection) await connection.end();
  }
});

app.use((err, req, res, next) => {
  console.error("Internal Server Error:", err);
  res.status(500).send("Internal Server Error");
});

async function createDatabaseIfNotExists() {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: dbHost,
      user: dbUser,
      password: dbPwd,
    });
    await connection.query(`CREATE DATABASE IF NOT EXISTS \`${dbName}\`;`);
<<<<<<< HEAD
  } catch (err) {
    console.error("Database creation error:", err.message);
=======
    await connection.changeUser({ database: dbName });

    await connection.query(`
      CREATE TABLE IF NOT EXISTS customer (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL
      );
    `);

    const hashedPassword = await bcrypt.hash("14", 10);
    await connection.query(`
      INSERT IGNORE INTO system_user (id, fullname, email, password, mailing_list, customer_id, admin) VALUES
      (14, 'Test User', '14', '${hashedPassword}', false, NULL, true);
    `);
  } catch (err) {
>>>>>>> 41e2118 (4)
  } finally {
    if (connection) await connection.end();
  }
}

createDatabaseIfNotExists().then(() => {
  app.listen(port, host, () => console.log(`${host}:${port} kuuntelee...`));
});
