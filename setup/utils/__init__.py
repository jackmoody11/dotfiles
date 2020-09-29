def prompt(question):
    """Prompt question until answer of "y" or "n" is given.

    Args:
        question (str): Question to be prompted.

    Returns:
        response (bool): Returns whether given "y" by user.
    """
    answer = ""
    while answer.lower() not in ("y", "n"):
        question = question + " (y/n) "
        answer = input(question)
    return answer == "y"
