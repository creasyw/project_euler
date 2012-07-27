from collections import defaultdict
import os
# It's almost the same as Q082.
# The differences are: more routes in graph and specific ending point.

# The implementation of graph could be:
# dict{ node:{node:distance, node:distance,...}, node{,,,}...}
# distance: the value in the matrix, node: row*100+col
def build_graph(matrix):
    graph = {}
    for i in range(len(matrix)):
        for j in range(len(matrix[0])):
            if j != 0 and i != 0 and j != len(matrix)-1 and i != len(matrix)-1:
                graph[i*100+j] = {(i-1)*100+j:matrix[i-1][j], (i+1)*100+j:matrix[i+1][j], i*100+j+1:matrix[i][j+1], i*100+j-1:matrix[i][j-1]}
            elif i == 0 and j != 0 and j != len(matrix)-1:
                graph[j] = {100+j:matrix[1][j], j+1:matrix[0][j+1], j-1:matrix[0][j-1]}
            elif i == len(matrix)-1 and j != 0 and j != len(matrix)-1:
                graph[i*100+j] = {(i-1)*100+j:matrix[i-1][j], i*100+j+1:matrix[i][j+1], i*100+j-1:matrix[i][j-1]}
            elif j == 0 and i != 0 and i != len(matrix)-1:
                graph[i*100] = {i*100+1:matrix[i][1], (i-1)*100:matrix[i-1][0], (i+1)*100:matrix[i+1][0]}
            elif j == len(matrix)-1 and i != 0 and i != len(matrix)-1:
                graph[i*100+j] = {(i-1)*100+j:matrix[i-1][j], (i+1)*100+j:matrix[i+1][j], i*100+j-1:matrix[i][j-1]}
            elif i == 0 and j == 0:
                graph[0] = {1:matrix[0][1], 100:matrix[1][0]}
            elif i == 0 and j == len(matrix)-1:
                graph[j] = {j-1:matrix[0][j-1], 100+j:matrix[1][j]}
            elif j == 0 and i == len(matrix)-1:
                graph[i*100] = {(i-1)*100:matrix[i-1][0], i*100+1:matrix[i][1]}
    return graph

# The basic algorithm comes from Wikipedia http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
# But there are some critical aspects missing in that article:
# 1. there should be a list keeping track of visited nodes, or it will visit the same node over and over again.
# 2. there are two other datasets: original graph and a priority queue
# 3. the algorithm tends to visit every node in the graph if possible. It is the"Traveling salesman problem".
# 4. if the goal is to find shortest path with given starting and ending points, just like this question. 
# Keeping track of shortest distance from begining and returning the 1st hit of the ending point with accumulated distance should be fine.
def dijkstra(graph, candidates):
    ending = 7979
    visited = {}
    while candidates != {}:
        candidate = min(candidates, key=candidates.get)
        visited[candidate] =  candidates.get(candidate)
        del candidates[candidate]
        if candidate == 7979:
            break
        for node in graph[candidate]:
            if node in visited:
                continue
            elif node in candidates:
                candidates[node] = min(candidates[node], visited[candidate]+graph[candidate][node])
            else:
                candidates[node] = visited[candidate]+graph[candidate][node]
    return visited[candidate]

def main():
    matrix = defaultdict(list)
    count = 0
    with  open(os.path.join(os.path.dirname(__file__), 'matrix.txt')) as matfile:
        for row in matfile:
            matrix[count] = [int(k) for k in row.split(',')]
            count += 1
    print dijkstra(build_graph(matrix), {0:matrix[0][0]})

if __name__ == "__main__":
    main()


