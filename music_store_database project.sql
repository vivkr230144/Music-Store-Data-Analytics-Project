Q1: Who is the senior most employee based on job title?

select  * from employee
ORDER BY levels desc
limit 1

Q2: Which countries have the most invoice?

select COUNT (*)  as c,billing_country
from invoice
group by billing_country
ORDER BY c desc
limit 1

Q3: What are top 3 values of total invoice

select total from invoice
order by total desc
limit 3

Q4:Which city has the best customers? We would like to throw a promotional music festivals in the
   city we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
   Returns both the city name & sum of all invoice totals

   select sum (total) as invoice_total,billing_city
   from invoice
   group by billing_city
   order by invoice_total desc

Q5:Who is the best customer? The custome who has spent the most money eill be declared the best 
   customer. Write a query that returns the persons who has spent the most money.

   select customer.customer_id,customer.first_name, customer.last_name,sum(invoice.total)as total
   from customer
   join invoice on customer.customer_id = invoice.customer_id
   group by customer.customer_id
   order by total desc
   limit 1

   Question set 2 -moderate
   Q1:Write query to return the email,first name ,last name,and Genere of all rock music listeners
       . return your list order alphabetically by email starting with A?

	  select distinct email,first_name,last_name
	  from customer
	  join invoice on customer.customer_id = invoice.customer_id 
	  join invoice_line on invoice.invoice_id = invoice_line.invoice_id
	  where track_id in(
         select track_id from track
		 join genre on track.genre_id = genre.genre_id
		 where genre.name like 'Rock'
	  )
	  order by email;

   Q2: Let's invite the artists who have written the most rock music in our dataset. write a query
      that returns the artist name an total track count of the top 10 rock bands?

     SELECT  artist.artist_id, artist.name,count(artist.artist_id) as number_of_songs
	  from track
	  join album on album.album_id = track.album_id
	  join artist on artist.artist_id = album.artist_id
	  join genre on genre.genre_id = track.genre_id
	  WHERE genre.name like 'Rock'
	  group by artist.artist_id
	  ORDER BY number_of_songs DESC
	  limit 10;

	Q3:Return all the track names that have a song length longer than the average song
	   length. return the name and milliseconds for each track. order by the song length with the 
	    longest songs listed first.

select name,milliseconds
from track
where milliseconds >(
          select avg(milliseconds) as avg_track_length
			 from track)
order by milliseconds desc;
		

	  