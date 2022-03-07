import psycopg2

def createAccount(name, volAdmin, status):

    con = pyscopg2.connect(database="d3rgi87qro6rh7", user='bcndnmmesmcjdn', password='c81fde3b255b272d3dec543b7fb122fbf43e6181140edbb221369f14f3bbefd2', host='ec2-3-227-195-74.compute-1.amazonaws.com', port='5432')

    cursor = con.cursor()

    queryCount = "SELECT count(*) from User Info Table;"
    results = []
    cursor.execute(queryCount, results)
    cursor.fetchone()

    for x in results: 
        numIds = x

    newId = numIds + 1

    queryInsert = "INSERT into User Info Table() VALUES (newId, name, volAdmin, status)"

    con.commit()
    con.close()