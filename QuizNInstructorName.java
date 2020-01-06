package quizer;

public class QuizNInstructorName {
    String quizName;
    String instructorName;
    int quizId;
    int instructorId;

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getInstructorId() {
        return instructorId;
    }

    public void setInstructorId(int instructorId) {
        this.instructorId = instructorId;
    }

    public String toString() {
        String temp;
        temp = this.quizName + " " + " uploaded by " + this.instructorName;
        return temp;
    }

    public QuizeNInstructorName(String quizName, String instructorName, int quizId, int instructorId) {
        super();
        this.quizName = quizName;
        this.instructorName = instructorName;
        this.quizId = quizId;
        this.instructorId = instructorId;
    }

}
