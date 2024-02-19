const puppeteer = require('puppeteer');

async function scrapeImagesWithKeyword(url, keyword) {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto(url);

    // Extract image URLs
    const imageUrls = await page.evaluate((keyword) => {
        const images = Array.from(document.querySelectorAll('img'));
        const filteredImages = images.filter(img => {
            const url = new URL(img.src);
            const filename = url.pathname.split('/').pop(); // Extract filename from URL
            return filename.includes(keyword);
        });
        return filteredImages.map(img => img.src);
    }, keyword);

    await browser.close();

    return imageUrls;
}

const url = 'https://www.warcraftmounts.com/gallery.php';
const keyword = 'mount';
scrapeImagesWithKeyword(url, keyword)
    .then(imageUrls => {
        console.log('% Load images into MATLAB');
        imageUrls.forEach((imageUrl, index) => {
            console.log(`image_${index} = imread('${imageUrl}');`);
        });
    })
    .catch(error => {
        console.error('Error during scraping:', error);
    });
