CREATE FUNCTION dbo.fn_get_adj_close_date_gaps (
    @ticker varchar(255),
    @target_start date,
    @target_end date
) RETURNS @result TABLE (
    [ticker] varchar(255) NOT NULL,
    [start_date] date NOT NULL,
    [end_date] date NOT NULL
)
AS
BEGIN
    -- If the table contains data already for this ticker
    IF EXISTS(SELECT 1 FROM dbo.adj_close_xref WHERE ticker = @ticker)
    BEGIN
        insert into @result
        select 
            [ticker],
            isnull([start_date], @target_start) as [start_date],
            isnull([end_date], @target_end) as [end_date]
        from dbo.v_adj_close_date_range_gaps
        where ticker = @ticker and
            (
                (([start_date] <= @target_start or [start_date] is null) and @target_start <= [end_date])   -- the target start is in range
                or ([start_date] <= @target_end and (@target_end <= [end_date] or [end_date] is null))      -- the target end is in range
                or (@target_start <= [start_date] and [end_date] <= @target_end)                            -- the target range in a subset
            )
    END
    ELSE
    BEGIN
        insert into @result
        values (@ticker, @target_start, @target_end)
    END

    RETURN
END




