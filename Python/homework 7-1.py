class Matrix:
    def __init__(self, matrix):
        self.matrix = matrix

    def __str__(self):
        return '\n'.join(','.join(map(str, row)) for row in self.matrix).replace(',', ' ')

    def __add__(self, other):
        matrix = []
        for i in range(len(self.matrix)):
            matrix.append([])
            for k in range(len(self.matrix[0])):
                matrix[i].append(self.matrix[i][k] + other.matrix[i][k])
        return Matrix(matrix)


a = Matrix([[1, 2, 3], [4, 5, 6]])
b = Matrix([[7, 8, 9], [10, 11, 12]])
print(a + b)
