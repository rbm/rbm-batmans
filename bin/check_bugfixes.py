import datetime
import shlex
import subprocess

from dateutil.relativedelta import relativedelta


START = datetime.date(2013, 01, 01)
GIT_COMMAND = "git log --merges --since \"{start} 00:00:00\" --until \"{end} 00:00:00\" --grep '\[bugfix\]' --oneline"


def main():
    start = START
    end = START
    while True:
        start = end
        end = end + relativedelta(months=1)
        cmd = shlex.split(GIT_COMMAND.format(
            start=start.strftime('%Y-%m-%d'),
            end=end.strftime('%Y-%m-%d')
        ))
        p = subprocess.check_output(cmd)
        count = len(p.split("\n"))
        print '%s-%s: %s' % (start, end, count)
        if end > datetime.datetime.utcnow().date():
            break


main()
