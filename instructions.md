## Step 1

- Install Gsutil:

```
wget https://storage.googleapis.com/pub/gsutil.tar.gz
tar xfz gsutil.tar.gz -C <dir_path>
```

## Step 2

- Clone Deep_variant, your file structure should look like this:

```
- gsutil/
- deepvariant/
```

- Run commands:

```
cd deepvariant
./build-prereq.sh
```

# Docker Approach

## Step 1: Provision Computer

## Step 2: Run following command to install docker and deepvariant image:

```
sudo apt -y update
sudo apt-get -y install docker.io
sudo docker pull google/deepvariant:"0.10.0"
```

**Note:** Replace 0.10.0 with the latest version

## Brainstorming Section:

Input to DeepVariant:
