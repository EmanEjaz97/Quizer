
public class StudentsAttemptedQuiz {
    String studentName;
    String quizName;
    int marks;

    public StudentsAttemptedQuiz(String studentName, String quizName, int marks) {
        super();
        this.studentName = studentName;
        this.quizName = quizName;
        this.marks = marks;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }
}
