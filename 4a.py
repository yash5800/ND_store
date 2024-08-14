def push(n):
    stack.append(n)
    print(n,"is inserted to stack")
def display():
    if len (stack)==0:
        print("stack is empty")
    else:
        l=[]
        for i in stack:
            l.inesert(0,i)
        print("elements of the stack are:",1)
        print("top of the stack is:",stack[-1])
stack=list()
while(1):
    print("\n 1.push\n 2.pop\n 3.display\n 4.exit\n enter your choice ")
    ch=int(input())
    if ch==1:
        print("push operation")
        n=int(input("enter the element to be inserted:"))
        push (n)
    elif ch==2:
        print("pop operation")
        if len (stack)==0:
            print("stack is empty")
        else:
            print(stack.pop(),"is deleted from stack")
    elif ch==3:
        print("diplay operation")
        display()
    else:
        print("exit from the program")
        break