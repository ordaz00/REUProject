from pydriller import Repository

def getStats(link)->dict:
    authorStats = {}
    for commit in Repository(link).traverse_commits():
        author = commit.author.name
        insertions = commit.insertions
        deletions = commit.deletions
        if author in authorStats:
            authorStats[author][0] += 1
            authorStats[author][1] += insertions
            authorStats[author][2] += deletions
        else:
            l = [1, insertions, deletions]
            authorStats[author] = l
    return authorStats

def getCommitStats(authorStats)->dict:
    authorCommits = {}
    for item in authorStats:
        if authorStats[item][0] in authorCommits:
            authorCommits[authorStats[item][0]] += 1
        else:
            authorCommits[authorStats[item][0]] = 1
    return authorCommits
    
def getFractions(stats)->dict:
    fractions = {}
    for author in stats:
        if (stats[author][1] + stats[author][2]) > 0:
            fraction = (stats[author][1])/(stats[author][1] + stats[author][2])
            if fraction in fractions:
                fractions[fraction] += 1
            else:
                fractions[fraction] = 1
    return fraction

def makeATxtFile(name, stats)->None:
    file = open(name, "w")
    for item in stats:
        line = str(item) + "," + str(stats[item])
        file.write(line)
    file.close()

def main()->None:
    links = ['https://github.com/rails/rails', 'https://github.com/apache/lucene', 'https://github.com/tensorflow/tensorflow', 'https://github.com/pytorch/pytorch']
    names = ["Ruby_On_Rails", "Lucene", "TensorFlow", "Pytorch"]
    for i in range(len(links)):
        link = links[i]
        title = names[i]
        stats = getStats(link)
        commitStats = getCommitStats(stats)
        fractions = getFractions(stats)
        makeATxtFile(title + "_Commit_Stats.txt", commitStats)
        makeATxtFile(title + "_Fraction_Stats.txt", fractions)

main()