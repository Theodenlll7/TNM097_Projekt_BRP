import os
import urllib.request
from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

# URL of the website
url = "https://simplearmory.com/#/eu/kazzak/ziagord/collectable/mounts/"

# Initialize Chrome WebDriver (assuming ChromeDriver is on the system path)
driver = webdriver.Chrome()

# Load the webpage
driver.get(url)

# Wait for the page to fully render (using WebDriverWait)
wait = WebDriverWait(driver, 10)
wait.until(EC.visibility_of_element_located((By.TAG_NAME, "img")))

# Get the page source
page_source = driver.page_source

# Parse the HTML content
soup = BeautifulSoup(page_source, 'html.parser')

# Find all image tags
image_tags = soup.find_all('img')

# Create a directory to store the images
os.makedirs('simplearmory_images', exist_ok=True)

# Download and save each image
for img in image_tags:
    img_url = img['src']
    print("Processing image URL:", img_url)

    # Handle relative URLs
    if img_url.startswith('//'):
        img_url = 'https:' + img_url

    img_name = os.path.basename(img_url)
    img_path = os.path.join('simplearmory_images', img_name)

    # Download the image
    try:
        urllib.request.urlretrieve(img_url, img_path)
        print(f"Downloaded: {img_name}")
    except Exception as e:
        print(f"Failed to download {img_url}: {e}")

print("All images downloaded successfully!")

# Quit the WebDriver
driver.quit()
