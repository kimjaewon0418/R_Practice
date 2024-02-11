#1문자열다루기
paste("백석", "고향")
paste0(1:5, c("st","nd","rd",rep("th",2)))
paste(1:5, collapse="")

txt <- "나는 지금 집으로 간다"
class(txt)
strsplit(txt, split="")

#정규 표현식
gsub("\\.", "", "statics.playbook")
gsub("\\?", "", "statics?playbook")

random_string <- c("123~123",
                   "123.123",
                   "123*123",
                   "123!123")
grep("\\d\\d\\d[.*]\\d\\d\\d", random_string)
grep("\\d\\d\\d[!~]\\d\\d\\d", random_string)

test_string <- c("재미있는 프로그램", "재미있는*program")
gsub("재\\w*", "", test_string)
gsub("재\\w{2}", "", test_string)

# * - 0또는 그 이상
# + - 1또는 그 이상
# ? - 0또는 1
# {3} - 딱 3개
# {3,5} - 3개에서 5개


#매칭 갯수 설정
test_string <- c("재미있는 프로그램", "재미있는*program")
m1 <- regexpr("재\\w", test_string)
m1 <- regexpr("재\\w\\w\\w", test_string)
m1 <- regexpr("재\\w*", test_string)
m1 <- regexpr("재\\w{2}", test_string)
regmatches(test_string, m1)

ex_str <- c("Mr. 슬통", "Mr. 마통",
            "Mr. Kim", "Mr. R")
m1 <- regexpr("Mr\\.", ex_str)
m2 <- regexpr("Mr\\.?", ex_str)
m3 <- regexpr("Mr(r|s)\\.?", ex_str)
regmatches(ex_str, m1)
regmatches(ex_str, m2)
regmatches(ex_str, m3)
















































