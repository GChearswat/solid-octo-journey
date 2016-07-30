//
//  ViewController.m
//  solid-octo-journey
//
//  Created by George Chearswat on 7/30/16.
//  Copyright © 2016 George Chearswat. All rights reserved.
//

#import "ViewController.h"

//NODE OBJECT

@interface Node : NSObject

@property int data;

@property Node *left;
@property Node *right;

- (instancetype)initWithData: (int) data;

@end

@implementation Node

- (instancetype)initWithData: (int) data {
    if (self == nil) {
        self = [[Node alloc] init];
    }
    _data = data;
    return self;
}

@end

//BINARY TREE OBJECT

@interface BinaryTree : NSObject

@property Node *root;

- (void) insertData: (int) data;

@end

@implementation BinaryTree

- (instancetype)init {
    if (self == nil) {
        self = [[BinaryTree alloc] init];
    }
    return self;
}

- (void) insertData:(int)data {
    Node *tempNode = [[Node alloc] initWithData:data];
    if (_root == nil) {
        _root = tempNode;
    } else {
        Node *tempRoot = _root;
        while (tempRoot != nil) {
            if (tempNode.data > tempRoot.data) {
                if (tempRoot.right == nil) {
                    tempRoot.right = tempNode;
                    break;
                } else {
                    tempRoot = tempRoot.right;
                }
            } else {
                if (tempRoot.left == nil) {
                    tempRoot.left = tempNode;
                    break;
                } else {
                    tempRoot = tempRoot.left;
                }
            }
        }
    }
}

- (void) BFS {
    
    //
    NSLog(@"lkasjdf"); 
}

@end

@interface ViewController ()

@property BinaryTree *tree;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *testArray = @[@1,@2,@3,@4,@5,@6,@7,@8,@9];
    
    _tree = [[BinaryTree alloc] init];
    
//    [_tree insertData:3];
//    [_tree insertData:4];
//    [_tree insertData:6];
//    [_tree insertData:5];
//    [_tree insertData:7];
//    [_tree insertData:8];
//    [_tree insertData:32];
//    [_tree insertData:32];
//    [_tree insertData:3];

    [self insertArrayIntoTree:testArray leftIndex:0 rightIndex:[testArray count]-1];
}

- (void) insertArrayIntoTree:(NSArray*) array leftIndex: (int)left rightIndex: (int)right {
    if (left <= right) {
        int mid = (left + right)/2;
        int valueToInsert = [(NSNumber*)array[mid] intValue];
        
        [_tree insertData:valueToInsert];
        
        [self insertArrayIntoTree:array leftIndex:left rightIndex:mid-1];
        [self insertArrayIntoTree:array leftIndex:mid+1 rightIndex:right];
    }
}

@end

