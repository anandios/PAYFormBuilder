//
//  PAYSectionsViewController.m
//  Example
//
//  Created by Simon Seyer on 25.04.14.
//  Copyright (c) 2014 Paij. All rights reserved.
//

#import "PAYSectionsViewController.h"

@interface PAYSectionsViewController ()

@end

@implementation PAYSectionsViewController

- (void)loadStructure:(PAYFormTableBuilder *)tableBuilder {
    [tableBuilder addSectionWithContentBlock:^(PAYFormSectionBuilder * sectionBuilder) {
        [sectionBuilder addButtonWithText:@"Section with label style empty"
                                    style:PAYFormButtonStyleDefault
                           selectionBlock:nil];
    }];
    
    [tableBuilder addSectionWithLabelStyle:PAYFormTableLabelStyleNone
                              contentBlock:^(PAYFormSectionBuilder * sectionBuilder) {
        [sectionBuilder addButtonWithText:@"Section with label style none"
                                    style:PAYFormButtonStyleDefault
                           selectionBlock:nil];
    }];
    
    [tableBuilder addSectionWithName:@"Label style simple (default)"
                        contentBlock:^(PAYFormSectionBuilder * sectionBuilder) {
        [sectionBuilder addButtonWithText:@"Section with label style simple"
                                    style:PAYFormButtonStyleDefault
                           selectionBlock:nil];
                          }];
    
    [tableBuilder addSectionWithName:@"Section with info button"
                        contentBlock:^(PAYFormSectionBuilder *sectionBuilder) {
                            [sectionBuilder addButtonWithText:@"Simple Entry"
                                                        style:PAYFormButtonStyleDefault
                                               selectionBlock:nil];
                        }
                           infoBlock:^(UIButton *infoButton) {
                               UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Info"
                                                                                                        message:@"This alert could explain what the section is about."
                                                                                                 preferredStyle:UIAlertControllerStyleAlert];
                               [alertController addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil]];
                               [alertController addAction:[UIAlertAction actionWithTitle:@"More help" style:UIAlertActionStyleDefault handler:nil]];
                               [self presentViewController:alertController animated:YES completion:nil];
                           }];
    
    [tableBuilder addSectionWithName:@"Section with label style description and without any content."
                          labelStyle:PAYFormTableLabelStyleDescription
                        contentBlock:nil];
    
    [tableBuilder addSectionWithName:@"Section with label style description wide and without any content."
                          labelStyle:PAYFormTableLabelStyleDescriptionWide
                        contentBlock:nil];
    [tableBuilder addSectionWithHeaderBlock:^(PAYFormHeader *formHeader) {
        UILabel *customLabel = [UILabel new];
        customLabel.translatesAutoresizingMaskIntoConstraints = NO;
        customLabel.textColor = [UIColor colorFromHex:0xFF5e3a];
        customLabel.text = @"Custom header";
        [formHeader.view addSubview:customLabel];
        
        UIView *formView = formHeader.view;
        [formHeader.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[formView]-(<=1@200)-[customLabel]"
                                                                                options:NSLayoutFormatAlignAllCenterY
                                                                                metrics:nil
                                                                                  views:NSDictionaryOfVariableBindings(customLabel, formView)]];
        [formHeader.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-50-[customLabel]"
                                                                                options:NSLayoutFormatAlignAllCenterY
                                                                                metrics:nil
                                                                                  views:NSDictionaryOfVariableBindings(customLabel, formView)]];
    } contentBlock:^(PAYFormSectionBuilder *sectionBuilder) {
        [sectionBuilder addFieldWithPlaceholder:@"Another Entry"];
    }];
    
    PAYHeaderView *header = [PAYHeaderView new];
    header.iconImage = [UIImage imageNamed:@"header"];
    header.title = @"The header title";
    header.subTitle = @"This is the subTitleLabel";
    self.tableView.tableHeaderView = header;
}

@end
