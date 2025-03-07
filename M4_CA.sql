/*
* Name: Module 4 Course Activity
* Author: Austin Strobel
* Date: 11/5/24
* Description: Creates tables and loads values
* Instructions: Click the execute as script button to create and load tables
* Changes:
*/
CREATE TABLE [Breakfast_Food]
(
	[Food_Id] INTEGER NOT NULL,
	[Name] VARCHAR(20) NOT NULL,
	CONSTRAINT [PK_Food_Id] PRIMARY KEY ([Food_Id])
);

INSERT INTO Breakfast_Food VALUES
(1, 'Eggs'),
(2, 'Bacon'),
(3, 'Pancakes'),
(4, 'Waffles');

CREATE TABLE [Toppings] 
(
	[Topping_Id] INTEGER NOT NULL,
	[Topping] VARCHAR(20) NOT NULL,
	CONSTRAINT [PK_Topping_Id] PRIMARY KEY ([Topping_Id])
);

INSERT INTO Toppings VALUES
(3, 'Syrup'),
(4, 'Whipped Cream'),
(5, 'Hot Sauce'),
(6, 'Fruit');

CREATE TABLE [Breakfast_Order]
(
	[Order_Id] INTEGER NOT NULL,
	[Food_Id] INTEGER NOT NULL,
	[Topping_Id] INTEGER NOT NULL,
	CONSTRAINT [PK_Order_Id] PRIMARY KEY ([Order_Id]),
	FOREIGN KEY ([Food_Id]) REFERENCES [Breakfast_Food] ([Food_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY ([Topping_Id]) REFERENCES [Toppings] ([Topping_Id])
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO Breakfast_Order VALUES
(1, 3, 3),  -- Pancakes with Syrup
(2, 4, 4),  -- Waffles with Whipped Cream
(3, 2, 5),  -- Bacon with Hot Sauce
(4, 1, 6);  -- Eggs with Fruit
