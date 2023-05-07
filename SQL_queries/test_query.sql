insert into dbo.adj_close_xref
values
('AAPL', '2022-01-01', '2022-01-10'),
('AAPL', '2022-01-25', '2022-01-30'),
('AAPL', '2022-01-11', '2022-01-22'),

truncate table dbo.adj_close_xref
truncate table dbo.adj_close


select * from dbo.fn_get_adj_close_date_gaps('AAPL', '2023-03-01', '2023-05-02')

select * from dbo.adj_close_xref
select * from dbo.adj_close