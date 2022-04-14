import subprocess

path = '/org/freedesktop/UPower/devices/mouse_hidpp_battery_4'
mouse_bat = subprocess.run(['upower', '-i', path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
mouse_bat = str(mouse_bat.stdout)
mouse_bat = mouse_bat[454:456].replace('%', '')
try:
    mouse_bat = float(mouse_bat)
except:
    mouse_bat = 0

bat_icon_10 = ''
bat_icon_20 = ''
bat_icon_30 = ''
bat_icon_40 = ''
bat_icon_50 = ''
bat_icon_60 = ''
bat_icon_70 = ''
bat_icon_80 = ''
bat_icon_90 = ''
bat_icon_100 = ''

mouse_stat = subprocess.run(['upower', '-i', path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
mouse_stat = str(mouse_stat.stdout)
mouse_stat = mouse_stat.count('state:               discharging')

normal_mouse_icon = ''
off_mouse_icon = ''

if mouse_stat == 1 :
    current_mouse_icon = normal_mouse_icon
else :
    current_mouse_icon = off_mouse_icon

if mouse_bat != '':
    if mouse_bat <= 10:
        current_bat_icon = bat_icon_10
    elif mouse_bat <= 20:
        current_bat_icon = bat_icon_20
    elif mouse_bat <= 30:
        current_bat_icon = bat_icon_30
    elif mouse_bat <= 40:
        current_bat_icon = bat_icon_40
    elif mouse_bat <= 50:
        current_bat_icon = bat_icon_50
    elif mouse_bat <= 60:
        current_bat_icon = bat_icon_60
    elif mouse_bat <= 70:
        current_bat_icon = bat_icon_70
    elif mouse_bat <= 80:
        current_bat_icon = bat_icon_80
    elif mouse_bat <= 90:
        current_bat_icon = bat_icon_90
    elif mouse_bat <= 100:
        current_bat_icon = bat_icon_100

print(current_mouse_icon + ' ' + current_bat_icon + ' ' + str(mouse_bat) + '%')
