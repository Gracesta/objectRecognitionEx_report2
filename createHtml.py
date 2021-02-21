
n = 25
if n == 50:
    html_file = open("result50.html", 'w')
else:
    html_file = open("result25.html", 'w')

DIR = "D:\\OneDrive\\文档\\MATLAB\\report2\\"
filePath = DIR + "reranking" + str(n) + ".txt"
html_file.write("<title>Result</title>")
html_file.write("<table border='5' cellspacing='1' cellpadding='2'>")
html_file.write("<tbody>")
# open the result file to write html file
with open(filePath, 'r') as f:
    for i in range(30):
        html_file.write("<tr>")
        for j in range(10):
            [imgPath, imgScore] = f.readline().split()
            imgPath = DIR + imgPath
            html_file.write("<td align='CENTER'>")
            html_file.write("<a href= '"+ imgPath + "'target='blank'><img src='" + imgPath + "' width='120' height='90'>")
            html_file.write("</a><br>" + imgScore + "</td>")
        html_file.write("</tr>")


    #
    html_file.write("</tr>")
    html_file.write("</tbody></table>")

    f.close()

html_file.close()

