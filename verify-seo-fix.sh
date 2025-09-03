#!/bin/bash
# Afya Mile Dental Clinic - SEO Fix Verification Script
# Run this after uploading files to verify everything works correctly

echo "🔍 Afya Mile Dental Clinic - SEO Fix Verification"
echo "================================================="

# Test URLs that should exist and load properly
echo ""
echo "✅ Testing Main Pages (should return 200 OK):"
curl -I -s "https://afyamiledental.com/" | head -1
curl -I -s "https://afyamiledental.com/cbd-location.html" | head -1  
curl -I -s "https://afyamiledental.com/multilingual-services.html" | head -1

echo ""
echo "🔄 Testing Redirects (should return 301 Moved Permanently):"
curl -I -s "http://afyamiledental.com/" | head -1
curl -I -s "https://www.afyamiledental.com/" | head -1
curl -I -s "https://www.afyamiledental.com/index.html" | head -1

echo ""
echo "📋 Testing SEO Files (should return 200 OK):"
curl -I -s "https://afyamiledental.com/sitemap.xml" | head -1
curl -I -s "https://afyamiledental.com/robots.txt" | head -1

echo ""
echo "🎯 Testing Service Pages (should return 200 OK):"
curl -I -s "https://afyamiledental.com/general-dentistry.html" | head -1
curl -I -s "https://afyamiledental.com/cosmetic-dentistry.html" | head -1
curl -I -s "https://afyamiledental.com/orthodontics.html" | head -1

echo ""
echo "================================================="
echo "✅ Verification Complete!"
echo ""
echo "Expected Results:"
echo "- Main pages: HTTP/1.1 200 OK"
echo "- Redirects: HTTP/1.1 301 Moved Permanently" 
echo "- SEO files: HTTP/1.1 200 OK"
echo "- Service pages: HTTP/1.1 200 OK"
echo ""
echo "If any show 404 or 500 errors, check file upload."
echo "If redirects don't show 301, check .htaccess file."
