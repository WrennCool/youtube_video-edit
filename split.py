import sys

mkvname = sys.argv[1]

#en_in=open('{}.en.vtt'.format(mkvname),'r')
#en_out = open('en.vtt','w')

keys = ['en','zh-CN','zh-TW']
#lines = []

def parse(infile,outfile):
    for each_line in infile:
        if each_line[:3] == '00:':
            outfile.write('\n\n')
            outfile.write(each_line)
        else:
            outfile.write(each_line.strip('\n'))


def main(keys):
    for i in keys:
        infile = open('{0}.{1}.vtt'.format(mkvname,i),'r',encoding='utf-8')
        outfile = open('{1}.vtt'.format(mkvname,i),'w',encoding='utf-8')
        parse(infile,outfile)
        outfile.close()
        infile.close()  
    print('=='*20)
    print('subtitles have already been parsed!')
    print('=='*20)
main(keys)




