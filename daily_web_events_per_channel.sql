/*QUIZ: average number of events for each channel per day*/
SELECT 
    channel,
    AVG(number_of_events) "Average number of events for each channel per day"
FROM (
    /*Events per channel per day*/
    SELECT 
        DATE_TRUNC('day', occurred_at) dy,
        channel,
        COUNT(*) number_of_events
    FROM web_events
    GROUP BY dy, channel
)eve_avg
GROUP BY channel