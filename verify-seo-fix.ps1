# Afya Mile Dental Clinic - SEO Fix Verification Script (PowerShell)
# Run this after uploading files to verify everything works correctly

Write-Host "🔍 Afya Mile Dental Clinic - SEO Fix Verification" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan

function Test-URL {
    param($url, $description)
    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing -MaximumRedirection 0 -ErrorAction SilentlyContinue
        Write-Host "✅ $description : $($response.StatusCode) $($response.StatusDescription)" -ForegroundColor Green
    }
    catch {
        $statusCode = $_.Exception.Response.StatusCode
        $statusDescription = $_.Exception.Response.StatusDescription
        if ($statusCode -eq 301 -or $statusCode -eq 302) {
            Write-Host "🔄 $description : $statusCode $statusDescription (Redirect - GOOD)" -ForegroundColor Yellow
        } else {
            Write-Host "❌ $description : $statusCode $statusDescription" -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host "✅ Testing Main Pages (should return 200 OK):" -ForegroundColor Green
Test-URL "https://afyamiledental.com/" "Homepage"
Test-URL "https://afyamiledental.com/cbd-location.html" "CBD Location Page"
Test-URL "https://afyamiledental.com/multilingual-services.html" "Multilingual Services Page"

Write-Host ""
Write-Host "🔄 Testing Redirects (should return 301 Moved Permanently):" -ForegroundColor Yellow
Test-URL "http://afyamiledental.com/" "HTTP to HTTPS redirect"
Test-URL "https://www.afyamiledental.com/" "WWW to non-WWW redirect"
Test-URL "https://www.afyamiledental.com/index.html" "WWW index.html redirect"

Write-Host ""
Write-Host "📋 Testing SEO Files (should return 200 OK):" -ForegroundColor Green
Test-URL "https://afyamiledental.com/sitemap.xml" "Sitemap"
Test-URL "https://afyamiledental.com/robots.txt" "Robots.txt"

Write-Host ""
Write-Host "🎯 Testing Service Pages (should return 200 OK):" -ForegroundColor Green
Test-URL "https://afyamiledental.com/general-dentistry.html" "General Dentistry"
Test-URL "https://afyamiledental.com/cosmetic-dentistry.html" "Cosmetic Dentistry"
Test-URL "https://afyamiledental.com/orthodontics.html" "Orthodontics"
Test-URL "https://afyamiledental.com/dental-implants.html" "Dental Implants"
Test-URL "https://afyamiledental.com/pediatric-dentistry.html" "Pediatric Dentistry"
Test-URL "https://afyamiledental.com/emergency-care.html" "Emergency Care"

Write-Host ""
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "✅ Verification Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Expected Results:" -ForegroundColor White
Write-Host "- Main pages: 200 OK" -ForegroundColor Green
Write-Host "- Redirects: 301 Moved Permanently" -ForegroundColor Yellow
Write-Host "- SEO files: 200 OK" -ForegroundColor Green
Write-Host "- Service pages: 200 OK" -ForegroundColor Green
Write-Host ""
Write-Host "If any show 404 or 500 errors, check file upload." -ForegroundColor Red
Write-Host "If redirects don't show 301, check .htaccess file." -ForegroundColor Red

Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Upload all files to your web server" -ForegroundColor White
Write-Host "2. Run this verification script again" -ForegroundColor White
Write-Host "3. Submit sitemap to Google Search Console" -ForegroundColor White
Write-Host "4. Request indexing for new pages" -ForegroundColor White
