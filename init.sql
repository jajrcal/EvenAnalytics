Create database Even;
Create database Even_Analytics;

\c even;
create table rate_tables
(
    lead_uuid                   text,
    rate_table_id               bigint,
    rate_table_offer_id         bigint not null
        constraint rate_tables_pk
            primary key,
    rate_table_offer_created_at timestamp,
    offer_apr                   double precision,
    offer_fee_fixed             double precision,
    offer_fee_rate              double precision,
    offer_monthly_payment       double precision,
    offer_rec_score             double precision,
    offer_rank_on_table         bigint,
    demand_sub_account_id       bigint,
    __index_level_0__           bigint
);
create table leads
(
    lead_uuid              text not null
        constraint leads_pk
            primary key,
    requested              double precision,
    state                  text,
    loan_purpose           text,
    credit                 text,
    annual_income          double precision,
    is_employed            text,
    monthly_net_income     double precision,
    mortgage_property_type text,
    has_mortgage           integer,
    zipcode                text,
    lead_created_at        timestamp,
    __index_level_0__      bigint
);
create table clicks
(
    rate_table_offer_id bigint not null
        constraint clicks_pk
            primary key
        constraint clicks_rate_tables_rate_table_offer_id_fk
            references rate_tables,
    num_clicks          bigint,
    last_click          timestamp,
    first_click         timestamp
);
