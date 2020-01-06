
public class QuizNInstructorName {
    String quizName;
    String instructorName;
    int quizId;
    int instructorId;
    String attempted;
    int marks;

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
    
    public int getMarks() {
        return marks;
    }

    public String getAttempted() {
        return attempted;
    }

    public void setAttempted(String attempted) {
        this.attempted = attempted;
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

    public QuizNInstructorName(String quizName, String instructorName, int quizId, int instructorId, String attempted, int marks) {
        super();
        this.quizName = quizName;
        this.instructorName = instructorName;
        this.quizId = quizId;
        this.instructorId = instructorId;
        this.attempted = attempted;
        this.marks = marks;
    }

}
