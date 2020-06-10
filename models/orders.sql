with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

final as (

    select 
        orders.order_id,
        orders.customer_id,
        SUM(payments.amount / 100) as amount

    from orders
    left join payments using(order_id)

    where payments.status = 'success'

    group by 1,2

)

select * from final