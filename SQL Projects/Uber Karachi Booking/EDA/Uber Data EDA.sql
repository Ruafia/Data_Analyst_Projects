# 1. Retrieve all successful bookings:
CREATE view Successful_Bookings as
SELECT *
FROM uber.booking
WHERE Booking_Status = "Success";
SELECT *
FROM Successful_Bookings;

# 2. Find the average ride distance for each vehicle type
CREATE view average_ride_distance_by_vehicle_type as
SELECT Vehicle_Type, ROUND(AVG(Ride_Distance),2)
FROM uber.booking
GROUP BY Vehicle_Type;
SELECT *
FROM average_ride_distance_by_vehicle_type;

# 3. Get the total number of cancelled rides by customers
CREATE View cancelled_rides_by_customers as
SELECT COUNT(Cancelled_Rides_by_Customer)
FROM uber.booking
WHERE Cancelled_Rides_by_Customer = 1 ;

SELECT *
FROM cancelled_rides_by_customers; 

# 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top5_customers as
SELECT Customer_ID, COUNT(Booking_ID) as number_of_rides
FROM uber.booking
GROUP BY Customer_ID
ORDER BY number_of_rides DESC
LIMIT 5;

SELECT *
FROM top5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_cancelled_by_drivers as
SELECT COUNT(Booking_Status)
FROM uber.booking
WHERE Booking_Status = "Cancelled by Driver" AND Reason_for_cancelling_by_Driver = "Personal & Car related issues";

SELECT *
FROM rides_cancelled_by_drivers ;

# 6. Find the maximum and minimum driver ratings for SUV bookings
CREATE View max_min_driver_rating as
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating
FROM uber.booking
WHERE Vehicle_Type = "SUV";

SELECT *
FROM max_min_driver_rating;

# 7. Find the average customer rating per vehicle type
CREATE VIEW avg_customer_rating as
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2)
FROM uber.booking
GROUP BY Vehicle_Type;

SELECT *
FROM avg_customer_rating;

# 8. Calculate the total booking value of rides completed successfully:
SELECT ROUND(SUM(Booking_Value),2)
FROM uber.booking
WHERE Booking_Status = "Success" ;

# 9. List all incomplete rides along with the reason:
CREATE View incomplete_ride_w_reason as
SELECT Booking_ID, Incomplete_Rides_Reason
FROM uber.booking
WHERE Booking_Status = "Incomplete";

SELECT *
FROM incomplete_ride_w_reason;

# What is the number of unique customers in the dataset
SELECT COUNT(DISTINCT Customer_ID) as unique_customers
FROM uber.booking;

# Find the number of bookings made on a specific date, say '2024-11-10'.
SELECT COUNT(Booking_ID)
FROM uber.booking
WHERE Date = "11/10/2024";

# What is the total ride distance for each vehicle type
SELECT Vehicle_Type, ROUND(SUM(Ride_Distance),2)
FROM uber.booking
GROUP BY Vehicle_Type;

# Count how many bookings were made for each pickup location
SELECT Pickup_Location, COUNT(Booking_ID)
FROM uber.booking
GROUP BY Pickup_Location;

# Retrieve all canceled rides where the reason for canceling is "Driver asked to cancel
SELECT *
FROM uber.booking
WHERE Reason_for_cancelling_by_Customer = "Driver asked to cancel";

# Show all the rides where the "Avg VTAT" (vehicle arrival time) is greater than 10 minutes
SELECT *
FROM uber.booking
WHERE Avg_VTAT > 10.00
ORDER BY Avg_VTAT DESC;

# Get all the bookings that had a customer rating lower than 3.
SELECT *
FROM uber.booking
WHERE Customer_Rating < 3
ORDER BY Customer_Rating DESC;

# List the bookings where the "Booking Status" is successful and the "Driver Ratings" are higher than 4.
SELECT *
FROM uber.booking
WHERE Booking_Status = "Success" AND Driver_Ratings > 4;

#Find all bookings made between two specific dates, say '2024-11-01' and '2024-11-10'.
SELECT *
FROM uber.booking
WHERE Date BETWEEN "01/10/2024" AND "11/10/2024" 
ORDER BY Date ASC;

# What is the average "Booking Value" for each vehicle type
SELECT Vehicle_Type, ROUND(AVG(Booking_Value),2)
FROM uber.booking
GROUP BY Vehicle_Type;

# Find the total "Cancelled Rides by Customer" for each "Reason for Cancelling by Customer"
SELECT Reason_for_cancelling_by_Customer, ROUND(COUNT(Cancelled_Rides_by_Customer),2)
FROM uber.booking
GROUP BY Reason_for_cancelling_by_Customer;

# Calculate the average "Ride Distance" for each "Pickup Location"
SELECT Pickup_Location, ROUND(AVG(Ride_Distance),2)
FROM uber.booking
GROUP BY Pickup_Location;

# For each "Booking Status", count the total number of rides (Success, Cancelled, Incomplete)
SELECT Booking_Status, ROUND(COUNT(Booking_ID),2)
FROM uber.booking
GROUP BY Booking_Status;

# Calculate the average "Driver Ratings" for each "Pickup Location"
SELECT Pickup_Location, ROUND(AVG(Driver_Ratings),2)
FROM uber.booking
GROUP BY Pickup_Location;

# Retrieve a list of all customers who have canceled more than 3 rides, along with the reasons for cancellation
SELECT Customer_ID, COUNT(*) as total_cancellation, Reason_for_cancelling_by_Customer
FROM uber.booking
WHERE Booking_Status = "Cancelled by Customer"
GROUP BY customer_ID, Reason_for_cancelling_by_Customer
HAVING COUNT(*) > 3;

# For each vehicle type, find the total "Booking Value" and the "Average Ride Distance"
SELECT Vehicle_Type, ROUND(SUM(Booking_Value),2) as total_booking_value, ROUND(AVG(Ride_Distance),2) as Average_Ride_Distance
FROM uber.booking
GROUP BY Vehicle_Type;

# List all the booking IDs where "Booking Status" is 'Cancelled' and the "Cancelled Rides by Driver" reason is "Personal & Car related issues"
SELECT Booking_ID
FROM uber.booking
WHERE Booking_Status = "Cancelled by Driver" AND Reason_for_cancelling_by_Driver = "Personal & Car related issues";

# Find the "Booking Value" for each "Drop Location" and group by "Vehicle Type".
SELECT Vehicle_Type, Drop_Location, ROUND(SUM(Booking_Value),2) as total_booking_value
FROM uber.booking
GROUP BY  Drop_Location, Vehicle_Type
ORDER BY total_booking_value DESC; 

# Identify the top 5 booking locations with the highest number of rides in a specific month.
SELECT Pickup_Location, ROUND(COUNT(Booking_ID),2) as total_rides
FROM uber.booking
GROUP BY Pickup_Location
ORDER BY total_rides DESC
LIMIT 5;

# Calculate the percentage of "Cancelled Rides by Customer" for each vehicle type
SELECT Vehicle_Type, 
	COUNT(CASE WHEN Booking_Status = "Cancelled by Customer" THEN 1 END) as cancel_count,
    COUNT(*) as total_ride,
    (COUNT(CASE WHEN Booking_Status = "Cancelled by Customer" THEN 1 END) * 100/ COUNT(*)) as cancelled_percent
FROM uber.booking
GROUP BY Vehicle_Type
ORDER BY cancelled_percent DESC;

# For each "Vehicle_Type", calculate the average "Avg VTAT" and "Avg CTAT".
SELECT Vehicle_Type, ROUND(AVG(Avg_VTAT),2), ROUND(AVG(Avg_CTAT),2)
FROM uber.booking
GROUP BY Vehicle_Type;

# Find the average "Ride Distance" for completed rides only
SELECT round(AVG(Ride_Distance),2) as Average_Ride_Distance
FROM uber.booking
WHERE Booking_Status = "Success";

#List the bookings that have a "Ride Distance" greater than the average "Ride Distance" across the entire dataset.
SELECT Booking_ID, Ride_Distance
FROM uber.booking
WHERE Ride_Distance > (SELECT AVG(Ride_Distance) FROM uber.booking);

# Find customers who have canceled more than 5 rides in total and show their last booking details.
SELECT Customer_ID, COUNT(Booking_ID)
FROM uber.booking
WHERE Booking_Status = "Cancelled by Customer"
GROUP BY Customer_ID
HAVING COUNT(Booking_ID) > 5;

WITH CancelledRides AS (
    SELECT 
        Customer_ID, 
        COUNT(Booking_ID) AS Cancelled_Count
    FROM uber.booking 
    WHERE Booking_Status = 'Cancelled by Customer'
    GROUP BY Customer_ID
    HAVING COUNT(Booking_ID) > 5
),
LastBookingDetails AS (
    SELECT 
        b.Customer_ID,
        b.Booking_ID,
        b.Date,
        b.Time,
        b.Pickup_Location,
        b.Drop_Location,
        b.Booking_Status,
        b.Booking_Value
    FROM uber.booking b
    WHERE NOT EXISTS (
        SELECT 1
        FROM uber.booking b2
        WHERE b.Customer_ID = b2.Customer_ID AND b2.Date > b.Date
    )
)
SELECT 
    c.Customer_ID, 
    c.Cancelled_Count, 
    l.Booking_ID, 
    l.Date, 
    l.Time, 
    l.Pickup_Location, 
    l.Drop_Location, 
    l.Booking_Status, 
    l.Booking_Value
FROM CancelledRides c
JOIN LastBookingDetails l
ON c.Customer_ID = l.Customer_ID;

# Calculate the total "Booking Value" of rides canceled due to "Vehicle Breakdown" for each vehicle type.
select Vehicle_Type, SUM(Booking_Value)
FROM uber.booking 
WHERE Incomplete_Rides_Reason = "Vehicle Breakdown"
GROUP BY Vehicle_Type;

# Find the number of bookings where the "Booking Value" is greater than the average "Booking Value" for each "Vehicle Type"
SELECT Vehicle_Type, COUNT(*)
FROM uber.booking
WHERE Booking_Value > (select AVG(Booking_Value) FROM uber.booking)
GROUP BY Vehicle_Type;

# Identify the reasons for "Cancelled Rides by Driver" where the "Booking Status" is 'Cancelled', and the "Cancelled Rides by Customer" is null.
SELECT distinct(Reason_for_cancelling_by_Driver)
FROM uber.booking
;
