import subprocess
import re

try :
    path = subprocess.run(['upower', '--dump'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    path = str(path.stdout)
    path = path.split('\\n')
    path = path[0].replace('Device:', '').replace('b"', '').strip()

    mouse = subprocess.run(['upower', '-i', path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    mouse = str(mouse.stdout)
    mouse = mouse.split('\\n')

    for i in mouse :
        if i.count('percentage:') == 1 :
            mouse_bat = i
        if i.count('state:') == 1 :
            mouse_state = i
    mouse_bat = re.search(r'\d+',mouse_bat).group()
    mouse_bat = float(mouse_bat)

    mouse_state = mouse_state.replace('state:', '').replace(' ', '')

    if mouse_state == 'charging' :
        bolt_icon = ' '
    else :
        bolt_icon = ''

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

    normal_mouse_icon = ''
    off_mouse_icon = ''

    if mouse_state == 'charging' or mouse_state == 'fully-charged' or mouse_state == 'discharging' :
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

    print(current_mouse_icon + ' ' + bolt_icon + current_bat_icon + ' ' + str(mouse_bat) + '%')
except:
    print("couldn't find a device")
