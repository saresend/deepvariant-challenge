# Introduction

The following steps should provide a fairly complete step by step how-to as to how to run
google's deepvariant project with hypertension journal information. Project proposed by Office Ally,
and is a submission for LA Hacks 2020.

### Notes and Disclaimers:

This project has only been tested with Ubuntu 18.X. It should work fairly as-is with most linux distros, and can certainly be ported to Windows and Mac. However, instructions will be written with linux in mind.

## Step 1: Clone this repo:

```
git clone https://github.com/saresend/deepvariant-challenge
```

## Step 2.1: Installing docker

If you are running on a fresh image, it is possible that you need to install docker. If so, please run the following:

```
sudo apt -y update
sudo apt-get -y install docker.io
```

## Step 2: Downloading Sample data (Optional)

The following command will load a truncated dataset provided by google for demonstration purposes. If running on an individual dataset please substitute with that.

```
./load_test_data.sh
```

### Step 2: Running Docker Build

This command will build the image, and also run the analysis on the data provided in the previous steps

```
docker build deepvariant-challenge --tags lahacks:0.1
```

## Step 4:

We use this command to instantiate our image, allowing us to collect the data that is the result of the analysis

```
cd deepvariant
docker run -dit lahacks:0.1
```

## Step 5: Copy output to local machine

### Step 5.1: Get Container Identifier

Please run the following command:

```
docker ps
```

This should provide a list of all your currently running containers. Look for one tagged lahacks:0.1, and find the entry under name. Common ones are things like `mythical_tree`, etc.

### Step 5.2: Copy files from Container

```
docker cp <container_name>/output output/
```

This command will take the output analysis and VCF files, and copy it locally.

## Step 6: Run Similarity analysis:

### Step 6.1: Jupyter Notebook installation

For installation instructions for jupyter notebooks, please refer to: https://jupyter.org/install

### Step 6.2: Running The notebook

The following command should analysis the resulting VCF file, and compare it with the data in the journal, loaded as `hypertension_markers.csv`.

This requires you to have jupyter notebook installed, please run:
**Note:** This notebook uses `python3`

```
jupyter notebook vcf_compare.ipynb
```

Inside is some preliminary analysis, and allows for flexibility to play around with the resulting data and conduct additional analysis.
