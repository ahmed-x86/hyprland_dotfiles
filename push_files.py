import subprocess
import os

def run_command(command):
    """تشغيل أوامر النظام واستقبال النتيجة"""
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout.strip().split('\n')

def git_step_push():
    # 1. الحصول على الملفات المعدلة (Modified)
    modified = run_command("git ls-files -m")
    
    # 2. الحصول على الملفات الجديدة (Untracked)
    untracked = run_command("git ls-files --others --exclude-standard")
    
    # دمج القائمتين وحذف الفراغات
    all_files = [f for f in (modified + untracked) if f]

    if not all_files:
        print("🚀 لا توجد تغييرات لرفعها!")
        return

    print(f"📦 تم العثور على {len(all_files)} ملفات. جاري الرفع التدريجي...")

    for file in all_files:
        print(f"--- 🛠️  Processing: {file} ---")
        
        # Git Add
        subprocess.run(f'git add "{file}"', shell=True)
        
        # Git Commit (رسالة باسم الملف)
        commit_msg = f"update: {os.path.basename(file)}"
        subprocess.run(f'git commit -m "{commit_msg}"', shell=True)
        
        # Git Push
        print(f"⬆️  Pushing {file}...")
        subprocess.run("git push", shell=True)

    print("\n✅ تم الانتهاء من رفع جميع الملفات بنجاح!")

if __name__ == "__main__":
    git_step_push()