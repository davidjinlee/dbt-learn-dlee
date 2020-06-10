SELECT 
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount,
    created
FROM  {{ source('stripe','payments') }}