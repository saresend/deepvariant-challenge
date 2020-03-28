## Step 1: Clone this repo:

```
git clone https://github.com/saresend/deepvariant-challenge
```

## Step 3: Run Docker build

```

docker build deepvariant --tags lahacks:0.1

```

## Step 4:

```

cd deepvariant
docker run -dit lahacks:0.1

```

## Copy output to local machine

### Determine container ID

```

docker ps

```

There should be an identifier listed under name, use that to refer to the instance

```

docker cp <container_name>:/output .

```

```

```
