if [ -z "${CATALOGUE_HOST}" ]; then
  echo Input CATALOGUE_HOST is missing
  exit 1
fi

if [ -z "${CATALOGUE_PORT}" ]; then
  echo Input CATALOGUE_PORT is missing
  exit 1
fi

if [ -z "${USER_HOST}" ]; then
  echo Input USER_HOST is missing
  exit 1
fi

if [ -z "${USER_PORT}" ]; then
  echo Input USER_PORT is missing
  exit 1
fi

if [ -z "${CART_HOST}" ]; then
  echo Input CART_HOST is missing
  exit 1
fi

if [ -z "${CART_PORT}" ]; then
  echo Input CART_PORT is missing
  exit 1
fi

if [ -z "${SHIPPING_HOST}" ]; then
  echo Input SHIPPING_HOST is missing
  exit 1
fi

if [ -z "${SHIPPING_PORT}" ]; then
  echo Input SHIPPING_PORT is missing
  exit 1
fi

if [ -z "${PAYMENT_HOST}" ]; then
  echo Input PAYMENT_HOST is missing
  exit 1
fi

if [ -z "${PAYMENT_PORT}" ]; then
  echo Input PAYMENT_PORT is missing
  exit 1
fi

cat /opt/nginx.conf | envsubst >/etc/nginx/nginx.conf
