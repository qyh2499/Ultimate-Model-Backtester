ALTER VIEW dbo.v_adj_close_date_range_gaps AS
    with 
    ranked_listings as (
        select 
            rank() over(partition by [ticker] order by [start_date] asc, [end_date] asc) as [rank],
            * 
        from dbo.adj_close_xref
    ),
    date_gaps as (
        -- Joined shift down by 1
        select
            isnull(RL1.ticker, RL2.ticker) as [ticker],
            RL1.end_date as [previous_end_date], 
            RL2.start_date as [next_start_date]
        from ranked_listings RL1
        full join ranked_listings RL2
        on RL1.ticker = RL2.ticker and RL1.rank = RL2.rank - 1
        where DATEADD(day, 1, RL1.end_date) < RL2.start_date
            or RL2.start_date is null
            or RL1.end_date is null
    )
    select 
        ticker,
        DATEADD(day, 1, previous_end_date) as [start_date],
        DATEADD(day, -1, next_start_date) as [end_date]
    from date_gaps
GO