def findindex(week,day,adddays):
    weekindex=week.index(day)
    newindex=((weekindex+adddays)%7)
    return newindex

def add_time(start, duration, day = False):
    week=['monday','tuesday','wednesday','thursday','friday','saturday','sunday']
    start = start.split()
    start_time=start[0].split(':')
    start_hours = start_time[0]
    start_minutes = start_time[1]

    daytime= start[1]
    add_days= False

    duration=duration.split(':')
    duration_hours=duration[0]
    duration_minutes=duration[1]

    new_minutes= int(start_minutes) + int(duration_minutes)
    hours_from_minutes=new_minutes//60
    new_minutes=new_minutes%60


    new_hours=int(start_hours) + int(duration_hours) + hours_from_minutes

    halfdays_from_hours = new_hours//12
    fulldays_from_hours = new_hours//24
    new_hours=new_hours%12
    if new_hours==0:
        new_hours=12

    if halfdays_from_hours%2 !=0 and daytime=='PM':
        daytime='AM'
    elif halfdays_from_hours%2 !=0 and daytime=='AM':
        daytime='PM'

    new_time='%d:%02d ' %(new_hours,new_minutes)+ daytime

    if day != False:
        start_day=day.lower()
        start_day_index=week.index(start_day)

    if (halfdays_from_hours >=1 and daytime=='AM') or halfdays_from_hours >1:
        if halfdays_from_hours%2 ==1 and daytime=='AM':
            if (halfdays_from_hours == 1 and daytime == 'AM') or halfdays_from_hours == 2:
                add_days = '(next day)'
                if day != False:
                    start_day = day.lower()
                    new_day=week[week.index(start_day)+1]
                    new_time = new_time + ', ' +new_day.capitalize()
                new_time = new_time + ' ' + add_days
            else:
                add_days='('+str((fulldays_from_hours+1))+' days later)'
                if day != False:
                    start_day = day.lower()
                    print(start_day)
                    newindex=findindex(week, start_day, fulldays_from_hours+1)
                    new_day=week[newindex]
                    new_time = new_time + ', ' +new_day.capitalize()
                new_time = new_time + ' ' + add_days
        elif halfdays_from_hours%2 ==1 and daytime=='PM':
            add_days = '(' + str((fulldays_from_hours )) + ' days later)'
            if day != False:
                start_day = day.lower()
                newindex = findindex(week, start_day, fulldays_from_hours )
                new_day = week[newindex]
                new_time = new_time + ', ' + new_day.capitalize()
            new_time = new_time + ' ' + add_days
        else:
            if fulldays_from_hours==1:
                add_days = '(next day)'
            else:
                add_days = '(' + str((fulldays_from_hours )) + ' days later)'
            if day != False:
                start_day = day.lower()
                new_day = week[week.index(start_day) + (fulldays_from_hours )]
                new_time = new_time + ', ' + new_day.capitalize()
            new_time = new_time + ' ' + add_days
    else:
        if day != False:
            start_day = day.lower()
            new_day = week[week.index(start_day)]
            new_time = new_time + ', ' + new_day.capitalize()
        if (halfdays_from_hours == 1 and daytime == 'AM') or halfdays_from_hours == 2:
            print('inloop')
            add_days = '(next day)'
            new_time = new_time + ' ' + add_days







    return new_time
