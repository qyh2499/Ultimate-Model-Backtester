drop table dbo.adj_close
CREATE TABLE dbo.adj_close (
    [index_id] bigint IDENTITY(1,1) NOT NULL,
    [ticker] varchar(255) NOT NULL,
    [date] date NOT NULL,
    [value] float NULL,
    PRIMARY KEY (
        [ticker] ASC,
        [date] ASC
    )
);

drop table dbo.adj_close_xref
CREATE TABLE dbo.adj_close_xref (
    [index_id] bigint IDENTITY(1,1) NOT NULL,
    [ticker] varchar(255) NOT NULL,
    [start_date] date NOT NULL,
    [end_date] date NOT NULL,
    PRIMARY KEY (
        [ticker] ASC,
        [start_date] ASC,
        [end_date] ASC
    )
)

