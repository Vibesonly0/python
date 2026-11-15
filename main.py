# Emotion Music Player / Oracle User Database


import cv2
import tkinter as tk
import os
import random
from threading import Thread
import pygame
from tkinter import messagebox
import oracledb
import matplotlib.pyplot as plt
from collections import Counter


# ================= ORACLE CLIENT =================
os.environ["PATH"] = r"C:\instantclient_21_8;" + os.environ["PATH"]
oracledb.init_oracle_client(lib_dir=r"C:\instantclient_21_8")


# ================= DATABASE CONNECTION =================
def get_connection():
   return oracledb.connect(
       user="emotion_user",
       password="anza1234",
       dsn="localhost:1521/XE"
   )


# ================= SAVE USER MOOD =================
def save_mood(username, mood, song):
   conn = get_connection()
   cur = conn.cursor()
   cur.execute("INSERT INTO mood_history(username,mood,song_name,scan_date) VALUES(:1,:2,:3,SYSDATE)",[username,mood,song])
   conn.commit()
   conn.close()


# ================= LOGIN SIGNUP =================
current_user = ""


def signup_user():
   username = signup_name.get().strip()
   password = signup_pass.get().strip()


   if username == "" or password == "":
       messagebox.showwarning("Warning", "Enter all signup fields")
       return


   try:
       conn = get_connection()
       cur = conn.cursor()
       cur.execute("INSERT INTO users(username,password) VALUES(:1,:2)",[username,password])
       conn.commit()
       conn.close()
       messagebox.showinfo("Success", "Account Created")
   except Exception as e:
       messagebox.showerror("Signup Error", str(e))




def login_user():
   global current_user
   username = login_name.get().strip()
   password = login_pass.get().strip()


   conn = get_connection()
   cur = conn.cursor()
   cur.execute("SELECT * FROM users WHERE username=:1 AND password=:2", [username,password])
   data = cur.fetchone()
   conn.close()


   if data:
       current_user = username
       login_window.destroy()
       launch_main_app()
   else:
       messagebox.showerror("Login Error", "Invalid Username or Password")


# ================= BASE PATH =================
BASE_PATH = r"C:\Users\User\Music\songs"
pygame.mixer.init()


MUSIC_FOLDER = {
   "happy": os.path.join(BASE_PATH, "happy"),
   "sad": os.path.join(BASE_PATH, "sad"),
   "neutral": os.path.join(BASE_PATH, "neutral"),
   "angry": os.path.join(BASE_PATH, "angry"),
   "romantic": os.path.join(BASE_PATH, "romantic")
}


current_playlist = []
current_index = 0
current_emotion = ""


# ================= MUSIC FUNCTIONS =================
def load_playlist(emotion):
   global current_playlist, current_index, current_emotion
   current_emotion = emotion
   folder = MUSIC_FOLDER.get(emotion)


   if not folder or not os.path.exists(folder):
       label.config(text=f"Folder missing: {emotion}")
       return


   songs = [file for file in os.listdir(folder) if file.endswith(".mp3")]


   if not songs:
       label.config(text="No songs found")
       return


   current_playlist = [os.path.join(folder, song) for song in songs]
   random.shuffle(current_playlist)
   current_index = 0
   play_music()




def play_music():
   global current_index
   if not current_playlist:
       return


   while current_index < len(current_playlist):
       song = current_playlist[current_index]
       try:
           pygame.mixer.music.load(song)
           pygame.mixer.music.play()
           song_name = os.path.basename(song)
           label.config(text=f"Playing: {song_name}")
           save_mood(current_user, current_emotion, song_name)
           return
       except:
           current_index += 1




def stop_music():
   pygame.mixer.music.stop()
   label.config(text="Stopped")




def next_song():
   global current_index
   if not current_playlist:
       return
   current_index = (current_index + 1) % len(current_playlist)
   play_music()


# ================= GRAPH =================
def show_graph():
   conn = get_connection()
   cur = conn.cursor()
   cur.execute("SELECT mood FROM mood_history WHERE username=:1", [current_user])
   moods = [row[0] for row in cur.fetchall()]
   conn.close()


   if not moods:
       messagebox.showinfo("Info", "No mood data")
       return


   count = Counter(moods)
   plt.bar(count.keys(), count.values())
   plt.title("Daily Mood Graph")
   plt.xlabel("Mood")
   plt.ylabel("Count")
   plt.show()


# ================= EMOTION DETECTION =================
def detect_emotion():
   label.config(text="Scanning Face...")
   cap = cv2.VideoCapture(0)
   face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')


   while cap.isOpened():
       ret, frame = cap.read()
       if not ret:
           break


       gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
       faces = face_cascade.detectMultiScale(gray, 1.3, 5)


       for (x, y, w, h) in faces:
           cv2.rectangle(frame, (x, y), (x+w, y+h), (0,255,0), 2)


       cv2.imshow("Press SPACE to Capture", frame)
       if cv2.waitKey(1) == 32:
           break


   cap.release()
   cv2.destroyAllWindows()


   emotion = random.choice(["happy", "sad", "neutral", "angry", "romantic"])
   mood_label.config(text=f"Emotion: {emotion.upper()}")
   load_playlist(emotion)




def run_detection():
   Thread(target=detect_emotion, daemon=True).start()


# ================= MAIN APP =================
def launch_main_app():
   global label, mood_label
   root = tk.Tk()
   root.title("Emotion Music Player")
   root.geometry("500x420")
   root.configure(bg="#191414")


   tk.Label(root, text=f"Welcome {current_user}", font=("Arial", 16, "bold"), fg="#1DB954", bg="#191414").pack(pady=10)


   tk.Button(root, text="SCAN FACE", command=run_detection,bg="#1DB954", fg="white", font=("Arial",12,"bold")).pack(pady=10)


   mood_label = tk.Label(root, text="Emotion: None", fg="white", bg="#191414")
   mood_label.pack(pady=5)


   label = tk.Label(root, text="Ready...", fg="white", bg="#191414")
   label.pack(pady=10)


   frame = tk.Frame(root, bg="#191414")
   frame.pack(pady=10)


   tk.Button(frame, text="Play", command=play_music, width=10).grid(row=0,column=0,padx=5)
   tk.Button(frame, text="Stop", command=stop_music, width=10).grid(row=0,column=1,padx=5)
   tk.Button(frame, text="Next", command=next_song, width=10).grid(row=0,column=2,padx=5)


   tk.Button(root, text="Daily Mood Graph", command=show_graph, width=20).pack(pady=15)


   root.mainloop()


# ================= LOGIN WINDOW =================
login_window = tk.Tk()
login_window.title("Login Signup")
login_window.geometry("500x300")
login_window.configure(bg="#191414")


tk.Label(login_window, text="Emotion Music Recommendation", font=("Arial",18,"bold"), fg="#1DB954", bg="#191414").pack(pady=10)


login_name = tk.Entry(login_window, width=25)
login_name.pack(pady=5)
login_name.insert(0,"Login Username")
login_pass = tk.Entry(login_window, width=25, show="*")
login_pass.pack(pady=5)
tk.Button(login_window, text="Login", command=login_user).pack(pady=8)


signup_name = tk.Entry(login_window, width=25)
signup_name.pack(pady=5)
signup_name.insert(0,"Signup Username")
signup_pass = tk.Entry(login_window, width=25, show="*")
signup_pass.pack(pady=5)
tk.Button(login_window, text="Create Account", command=signup_user).pack(pady=8)


login_window.mainloop()
