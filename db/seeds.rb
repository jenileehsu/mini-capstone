Product.destroy_all
Supplier.destroy_all
Image.destroy_all

Supplier.create([
  {
    name: "Book Lovers, Inc.",
    email: "book@booklovers.com",
    phone: "I-LUV-BOOK"
  },
   {
    name: "Reading Mania",
    email: "email@readingmania.com",
    phone: "888-234-5678"
  },
  {
    name: "Childrens Books Co.",
    email: "email@childrensbooks.com",
    phone: "800-KID-BOOK"
  }
  ])

Product.create!([
  {name: "City of Thieves",
    price: "12.0",
    description: "David Benioff",
    in_stock: nil,
    supplier_id: 1},
  {name: "The Cat in the Hat", 
    price: "10.0", 
    description: "Dr. Seuss", 
    in_stock: nil, 
    supplier_id: 3},
  {name: "Little Bee", 
    price: "15.0", 
    description: "Chris Cleave", 
    in_stock: nil, 
    supplier_id: 2},
  {name: "Snow White and the Seven Dwarves", 
    price: "1.0", 
    description: "Walt Disney", 
    in_stock: nil, 
    supplier_id: 3}
])


Image.create!([
  { url: "https://images-na.ssl-images-amazon.com/images/I/81i8JgTuWUL.jpg",
    product_id: 1},
  { url: "https://upload.wikimedia.org/wikipedia/en/thumb/b/b5/Seuss-cat-hat.gif/220px-Seuss-cat-hat.gif",
    product_id: 2},
  { url: "http://images.gr-assets.com/books/1344401905l/6948436.jpg",
    product_id: 3},
  { url: "https://i.jeded.com/i/snow-white-and-the-seven-dwarfs.31581.jpg",
    product_id: 4}
 ])
