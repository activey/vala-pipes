using pipes;

public class PipesDemo {

    public void testPipes() throws Error {
        new PipedExecutableRunner("uname", "-a").run(output => {
            stdout.printf("Full output: %s \n", output.getText());        

            new PipedExecutableRunner("awk", "{print substr($1, 0, length($1))}").runWithInput(output.getStream(), finalOutput => {
                stdout.printf("First column usin awk: %s \n", finalOutput.getText());
            });
        }); 
    }
}

void main (string[] args) {
    try {
        new PipesDemo().testPipes();
    } catch (Error e) {
        error(e.message);
    }
}