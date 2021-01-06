use yelpdb;
set global MAX_EXECUTION_TIME=10000;

# This Query finds the number of friends on Yelp a particular Yelp user has
select count(user2_id) 
from yelpdb.users_relationships as u1
group by user1_id;

# This Query finds the number of reviews each hotel in its respective city,state received 
# Highest reviewed businesses
select b.business_state,b.business_city,b.business_name
from business as b, review as r
where b.business_id = r.business_id and r.review_stars= ( select max(rs.review_stars) from review as rs);

# For WEBSITE
# The best hotel in the DB present 
select b.business_state, b.business_city,b.business_name,count(b.business_city)
from yelpdb.business as b, yelpdb.review as r
where b.business_id = r.business_id and r.review_stars = (select max(review_stars) from yelpdb.review);

# The maximum stars
select max(review_stars) from yelpdb.review;
select count(review_id) from yelpdb.review where review_stars=5;


# Top categories in DB in descending order.
select cat.category_name,count(cat.category_name) 
from category as cat, business_category as bc, business as b
where cat.category_id = bc.category_id and bc.business_id = b.business_id
 group by cat.category_name
 order by count(cat.category_name) desc;

# The cool query
select b.business_name
from business as b
where b.business_id in (SELECT r.business_id from review as r group by r.business_id having
sum(r.review_cool) >450
order by sum(r.review_cool) desc);

#All the restaurtants which are open.
select distinct business_name from business as b, business_attributes as ba
where b.business_id = ba.business_id and ba.business_accepts_creaditcard = 1 and b.business_id in ( select b1.business_id
from business_category as b1,category as c1 where b1.category_id = c1.category_id and c1.category_name like 
'%Restaurants'); 

#How many users visited in each of the following rated places
select r.review_stars,count(*) as avgcount
from review as r
group by r.review_stars
order by r.review_stars desc;

#5 Rated photographers in NY State
select distinct b.business_name,r.review_stars
from business as b, business_category as bc, category as c,review as r
where b.business_id = bc.business_id and bc.category_id=c.category_id and c.category_name like 'Photographers' 
and r.review_stars = 5 and b.business_state = 'NY';

#Useful reviews in each state
select b.business_state,count(r.review_useful)
from business as b,review as r 
where b.business_id = r.business_id
and r.review_useful = 1
group by b.business_state
order by count(r.review_useful) desc; 





  

