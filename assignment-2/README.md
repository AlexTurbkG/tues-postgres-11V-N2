# Decisions I made and why

## Tables

I made four tables: `students`, `menu_items`, `orders` and `order_items`.
People, the menu and the orders are different things, so I store each one
once. This way names and prices are not repeated on every row.

## Linking table

`order_items` connects the other tables. One order has many people and one
person can order many items, so a third table is needed to say who ordered
what, in which order and how many pieces (`quantity`).

## Keys

Every table has a primary key. In `order_items` the key is
(order_id, student_id, menu_item_id), so one person cannot have the same item
twice in one order. If someone wants two pieces, there is one row with a
bigger quantity. All links to other tables use `FOREIGN KEY`, so the database
refuses an id that does not exist.

## Types

Prices are `NUMERIC(6,2)` because it stores exact money values without
rounding errors. Dates are `DATE`, so they can be sorted and compared
correctly. Required columns are `NOT NULL`.

## What I deliberately do not store

I do not store totals or amounts owed. They are calculated by the queries
from `quantity * price`, so they can never get out of sync with the data.