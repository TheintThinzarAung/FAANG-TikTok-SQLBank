with video_count as (
    select 
        user_id,
        count(video_id) as total_videos
    from videos_watched
    group by user_id
),
min_user as (
    select user_id
    from video_count
    where total_videos = (
        select min(total_videos) 
        from video_count
    )
)
select vw.video_id
from videos_watched vw
join min_user mu
    on vw.user_id = mu.user_id;
