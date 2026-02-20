echo -e "🔄 جاري تفعيل خدمات الشبكة والبلوتوث..."
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth