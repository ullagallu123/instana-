# DB's and cache

```bash
docker network create rb
```

```bash
docker run --rm -dit --name mongo --network rb siva9666/mongo-instana:v1
```

```bash
docker run --rm -dit --name debug --network rb siva9666/debug:2.0
```

```bash
docker run --rm -dit --name mysql -e MYSQL_ROOT_PASSWORD=RoboShop@1 --network rb siva9666/mysql-instana:v1
```

```bash
docker run --rm -dit --name redis --network rb siva9666/redis-instana:v1
```

```bash
docker run --rm -dit --name rabbit --network rb siva9666/rabbit-instana:v1
```

This formatting makes each command easier to read and copy for execution. Let me know if you need any further assistance!
# catalogue,cart,user

```bash
docker run --rm -dit -e MONGO=true -e MONGO_URL="mongodb://mongo:27017/catalogue" --name catalogue --network rb siva9666/catalogue-instana:v1
```

```bash
docker run --rm -dit -e MONGO=true -e MONGO_URL="mongodb://mongo:27017/users" -e REDIS_HOST=redis --name user --network rb siva9666/user-instana:v1
```

```bash
docker run --rm -dit -e CATALOGUE_HOST=catalogue -e CATALOGUE_PORT=8080 -e REDIS_HOST=redis --name cart --network rb siva9666/cart-instana:v1
```

# shipping
```bash
docker run --rm -dit \
  -e DB_HOST="mysql" \
  -e DB_PORT="3306" \
  -e DB_USER="shipping" \
  -e DB_PASSWD="RoboShop@1" \
  -e CART_ENDPOINT="cart:8080" \
  --name shipping \
  --network rb \
  siva9666/shipping-instana:v1
```

# payment
```bash
docker run --rm -dit --name payment \
    -e CART_HOST="cart" \
    -e CART_PORT=8080 \
    -e USER_HOST="user" \
    -e USER_PORT=8080 \
    -e AMQP_HOST="rabbit" \
    -e AMQP_USER=roboshop \
    -e AMQP_PASS=roboshop123 \
    --network rb \
    siva9666/payment-instana:v1
```
# dispatch
```bash
docker run --rm -dit --name dispatch \
	-e AMQP_HOST="rabbit" \
    	-e AMQP_USER=roboshop \
    	-e AMQP_PASS=roboshop123 \
    	--network rb \
      siva9666/dispatch-instana:v1
```
# web 
```bash
docker run --rm -dit --name web -p 80:80 --network rb siva9666/web-instana:v2
```