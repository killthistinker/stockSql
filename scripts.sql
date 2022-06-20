USE ac8_maxim_popovich;

-- 1 Запрос
SELECT
  p.product 'Наименование товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id
INNER JOIN stocks s ON s.id = m.stock_products_placed_id
WHERE s.id = 1 AND
m.date BETWEEN '2011-01-01' AND '2019-01-11'
GROUP BY p.id
ORDER BY  p.product;

-- 2 Запрос 
SELECT
  p.product 'Наименование товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id
INNER JOIN stocks s ON s.id = m.stock_products_taken_id
WHERE s.id = 1 AND
m.date BETWEEN '2011-01-01' AND '2019-01-11'
GROUP BY p.id
ORDER BY  p.product;

-- 3 Запрос 
SELECT
  c.category 'Категория товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id
INNER JOIN categories c ON c.id = p.category_id
INNER JOIN stocks s ON s.id = m.stock_products_placed_id
WHERE s.id = 1 AND
m.date BETWEEN '2011-01-01' AND '2019-01-11'
GROUP BY c.id
ORDER BY  c.category;

-- 6 Запрос 
SELECT
  p.product 'Категория товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id
INNER JOIN counterpartyes c ON c.id = m.counterparty_id
LEFT JOIN movements_products mp ON mp.stock_products_placed_id = m.id
WHERE c.id = 1 AND
m.date BETWEEN '2011-01-01' AND '2019-01-11'
GROUP BY p.id
ORDER BY  p.product;

-- 7 Запрос 
SELECT
  p.product 'Категория товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id
INNER JOIN counterpartyes c ON c.id = m.counterparty_id
LEFT JOIN movements_products mp ON mp.stock_products_placed_id = m.id
WHERE m.counterparty_id = 1 AND
m.stock_products_placed_id = 1 AND
m.date BETWEEN '2011-01-01' AND '2019-01-11'
GROUP BY p.id
ORDER BY  p.product;

-- 8 Запрос 
SELECT
  p.product 'Категория товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id
INNER JOIN counterpartyes c ON c.id = m.counterparty_id
LEFT JOIN movements_products mp ON mp.stock_products_taken_id = m.id
WHERE m.counterparty_id = 1 AND
m.stock_products_taken_id = 1 AND
m.date BETWEEN '2011-01-01' AND '2019-01-11'
GROUP BY p.id
ORDER BY p.product;

-- 9 Запрос 
SELECT
  c.counterparty 'Контрагенты',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id 
INNER JOIN counterpartyes c ON c.id = m.counterparty_id 
LEFT JOIN movements_products mp ON mp.stock_products_placed_id = m.id 
WHERE m.date BETWEEN '2011-01-01' AND '2019-01-11' AND
p.id = 3 AND m.stock_products_placed_id IS NOT NULL
GROUP BY c.id
ORDER BY  c.counterparty;

-- 10 запрос 
SELECT
  c.counterparty 'Контрагенты',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id 
INNER JOIN counterpartyes c ON c.id = m.counterparty_id 
LEFT JOIN movements_products mp ON mp.stock_products_taken_id = m.id 
WHERE m.date BETWEEN '2011-01-01' AND '2019-01-11' AND
p.id = 3 AND m.stock_products_taken_id IS NOT NULL
GROUP BY c.id
ORDER BY  c.counterparty;

-- 11 запрос
SELECT
  p.product 'Наименование товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id 
LEFT JOIN movements_products mp ON mp.stock_products_taken_id = m.id 
WHERE m.date BETWEEN '2011-01-01' AND '2019-01-11' AND
m.stock_products_taken_id = 1  AND m.stock_products_placed_id IS NOT NULL
GROUP BY p.id
ORDER BY  p.product; 

-- 12 запрос
SELECT
  p.product 'Наименование товара',
  SUM(m.qty) 'Количество'
FROM movements_products m
INNER JOIN products p ON p.id = m.product_id 
LEFT JOIN movements_products mp ON mp.stock_products_placed_id = m.id 
WHERE m.date BETWEEN '2011-01-01' AND '2019-01-11' AND
m.stock_products_placed_id = 1  AND m.stock_products_taken_id IS NOT NULL
GROUP BY p.id
ORDER BY  p.product; 